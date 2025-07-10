;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 9.05-curr-age_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'curr-age)

#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete
== Data ==
    1. Data Description✅
        1B. if using define-struct, write all accessor signatures✅
    2. Interpretation✅
    3. Data Examples✅
    4. A function template that processes this data✅
== Functions ==
    1. Signature, purpose, stub ✅
    2. Examples (aka check-expect/tests, elaborate the concrete) ✅
    3. Template(from data)?✅
    3. Code body ✅
    4. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#

#|PROBLEM A:
Finish the uncompleted steps ❌ of Data Design above for Person and Date 
|#

(define-struct date [month day year])
; Date is (make-date Number Number Number)
; interp.
; Fields are self explanatory
(define xmas-2k (make-date 12 25 2000))
(define xmas-2025 (make-date 12 25 2025))
(define newyears-2025 (make-date 1 1 2025))
(define lastday-2025 (make-date 12 31 2025))

; date-month : (Date -> Number)
; date-day : (Date -> Number)
; date-year : (Date -> Number)
(define (date-temp dt)
  (... (date-month dt) 
       (date-day dt)
       (date-year dt)))

(define-struct person [fname lname birthdate])
; Person is (make-person String String Date)
; interp.
; fname means firstname
; lname means lastname
; date is self explanitory

; person-fname : (Person -> String)
; person-lname : (Person -> String)
; person-birthdate : (Person -> Date)

(define bob (make-person "bob" "smith" xmas-2k))

(define (person-temp ps)
  (... (person-fname ps)
       (person-lname ps)
       (date-temp (person-birthdate ps)))) ;reference

#|PROBLEM B:
Design the function "curr-age" that consumes a Date and a Person, and produces the approximate age of the Person relative the given date 
|#

; curr-age : (Date Person -> Number)
; produces the current age of the person
(check-expect (curr-age bob newyears-2025) 24)
(check-expect (curr-age bob xmas-2025) 25)
(check-expect (curr-age bob lastday-2025) 25)
(check-expect (curr-age bob xmas-2k) 0)

; (define (curr-age dt ps) 0)

(define (curr-age ps dt)
  (years-between (person-birthdate ps) dt)) ;reference


; years-between : (Date Date -> Number)
; produces the years elapsed by the two dates

(define (years-between old new)
  (cond
    [(and (<= (date-month old) (date-month new))
          (<= (date-day old) (date-day new)))
     (- (date-year new) (date-year old))]
    [else
     (- (date-year new) (date-year old) 1)]))

(define (years-between2 old new)
  (- (date-year new) (date-year old)
     (if
      (and (<= (date-month old) (date-month new))
           (<= (date-day old) (date-day new)))
      0
      1)))