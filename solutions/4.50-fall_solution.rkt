;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4.50-fall_starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'fall?)
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
    4. Code body ✅
    5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#

; A Month is one of:
; - "January"
; - "February"
; - "March"
; - "April"
; - "May"
; - "June"
; - "July"
; - "August"
; - "September"
; - "October"
; - "November"
; - "December"

; month-temp: (Month -> ???)
(define (month-temp m)
  (cond
    [(string=? m "January") ...]
    [(string=? m "February") ...]
    [(string=? m "March") ...]
    [(string=? m "April") ...]
    [(string=? m "May") ...]
    [(string=? m "June") ...]
    [(string=? m "July") ...]
    [(string=? m "August") ...]
    [(string=? m "September") ...]
    [(string=? m "October") ...]
    [(string=? m "November") ...]
    [(string=? m "December") ...]))

#|PROBLEM A:
Notice how some parts of the data definitions recipe
have been done for "Month". Finish writing the template.
|#

#|PROBLEM B:
Design the function "fall?" that decides whether the 
given month is between [September and November].
|#

; fall? : (Month -> Boolean)
; produces #true if the given Month is between [September and November]
(check-expect (fall? "January") #false)
(check-expect (fall? "February") #false)
(check-expect (fall? "March") #false)
(check-expect (fall? "April") #false)
(check-expect (fall? "May") #false)
(check-expect (fall? "June") #false)
(check-expect (fall? "July") #false)
(check-expect (fall? "August") #false)
(check-expect (fall? "September") #true)
(check-expect (fall? "October") #true)
(check-expect (fall? "November") #true)
(check-expect (fall? "December") #false)

; (define (fall? m) #false)

(define (fall? m)
  (cond
    [(string=? m "January") #false]
    [(string=? m "February") #false]
    [(string=? m "March") #false]
    [(string=? m "April") #false]
    [(string=? m "May") #false]
    [(string=? m "June") #false]
    [(string=? m "July") #false]
    [(string=? m "August") #false]
    [(string=? m "September") #true]
    [(string=? m "October") #true]
    [(string=? m "November") #true]
    [(string=? m "December") #false]))

(define (fall?OPTIMAL m)
  (or (string=? m "September")
      (string=? m "October")
      (string=? m "November")
      (string=? m "December")))