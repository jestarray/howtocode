;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 7.00-eligible_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'discount)
#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete
== Data ==
    1. Data Description✅
    2. Interpretation✅
    3. Data Examples✅
    4. A function template that processes this data✅
== Functions ==
    1. Signature, purpose, stub ✅
    2. Examples (aka check-expect, elaborate the concrete) ✅
    3. Template(from data)?✅
    3. Code body ✅
    4. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#

#|PROBLEM A:
Design a data definition to represent properties of a person and if they are disabled.
For example:
FirstName LastName Age Disabled
"Morty"   "Smith"  12  #false
"Jessica" "Lee"    12  #true
"Lisa"    "Su"     65  #false
"Bob"     "Smith"  61  #true
|#

(define-struct person [fn ln age disabled])
; Person is (make-person String String Number Boolean)
; interp.
; fn means first name
; ln means last name
; age means how old
; disabled means handicapped or not

; person-fn: (Person -> String)
; person-ln: (Person -> String)
; person-age: (Person -> Number)
; person-disabled: (Person -> Boolean)
; person?: (Person -> Boolean)

(define p1 (make-person "Morty" "Smith" 12 #false))
(define p2 (make-person "Jessica" "Lee" 12 #true))
(define p3 (make-person "Lisa" "Su" 65 #false))
(define p4 (make-person "Bob" "Smith" 61 #true))

(define (person-temp ps)
  (...
   (person-fn ps)
   (person-ln ps)
   (person-age ps)
   (person-disabled ps)
   ))

#|PROBLEM B:
Design a function 'discount?' that produces #true if the given person is 60 or older, or is disabled |#

; discount?: (Person -> Boolean)
; produces #true if the given person is 60 or older or is disabled
(check-expect (discount? p1) #false)
(check-expect (discount? p2) #true)
(check-expect (discount? p3) #true)
(check-expect (discount? p4) #true)

; (define (discount? ps) #false)

(define (discount? ps)
  (or (>= (person-age ps) 60)
      (person-disabled ps)))