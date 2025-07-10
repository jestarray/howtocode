;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4.57-days-between_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'days-between)
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

; A Year is a non-negative integer
; Examples:
;   0
;   1789
;   2018
; Non-examples:
;   -5000
;   "AD 2018"

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

; A Day is an integer at least 1 but at most 31
; Examples:
;   1
;   10
;   31
; Non-examples:
;   32
;   "today"

; month->days-in-year : Month -> Number
; returns the days elapsed in the start of the year
; (check-expect (month->days-in-year "January") 0)
; (check-expect (month->days-in-year "February") 31)
; (check-expect (month->days-in-year "March") 59)
(define (month->days-in-year m)
  (cond
    [(string=? m "January") 0]
    [(string=? m "February") (+ 0 31)]
    [(string=? m "March") (+ 0 31 28)]
    [(string=? m "April") (+ 0 31 28 31)]
    [(string=? m "May") (+ 0 31 28 31 30)]
    [(string=? m "June") (+ 0 31 28 31 30 31)]
    [(string=? m "July") (+ 0 31 28 31 30 31 30)]
    [(string=? m "August") (+ 0 31 28 31 30 31 30 31)]
    [(string=? m "September") (+ 0 31 28 31 30 31 30 31 31)]
    [(string=? m "October") (+ 0 31 28 31 30 31 30 31 31 30)]
    [(string=? m "November") (+ 0 31 28 31 30 31 30 31 31 30 31)]
    [(string=? m "December") (+ 0 31 28 31 30 31 30 31 31 30 31 30)]))

; year-month-day->days : Year Month Day -> Number
; returns the number of days elapsed since January 1, 0000
; given: 0000 "January" 1     expect: 0
; given: 0001 "January" 1     expect: 365
; given: 0001 "February" 1     expect: 396
; given: 2017 "August" 28  expect: 736444

; (check-expect (year-month-day->days 0000 "January" 1) 0)
; (check-expect (year-month-day->days 0001 "January" 1) 365)
; (check-expect (year-month-day->days 0001 "February" 1) (+ 365 31))
; (check-expect (year-month-day->days 2017 "August" 28) 736444)

(define (year-month-day->days y m d)
  (+ (* y 365) (month->days-in-year m) d -1))

#|PROBLEM:
Notice how some elements of the design recipe
have been completed. Finish the design of
the function "days-between" below, which
consumes 2 dates and produces the days between them.

The word “between” here means that there are 
2 days between yesterday and tomorrow, not 1 or 3 days.
Basically we include the current today and yesterday, thus 2 days.

HINT: Above you're provided with the function "year-month-day->days"
which is a problem you should have done previously.
Use it in your solution of this problem along with the abs function.
https://docs.racket-lang.org/htdp-langs/beginner.html#%28def._htdp-beginner._%28%28lib._lang%2Fhtdp-beginner..rkt%29._abs%29%29
|#

; days-between : Year Month Day Year Month Day -> Number
; produces the days between 2 given dates

(check-expect (days-between 2022 "January" 1
                            2022 "January" 4) 3)

(check-expect (days-between 2022 "August" 4
                            2022 "August" 5) 1)

(check-expect (days-between 2022 "October" 4
                            2022 "October" 6) 2)

(check-expect (days-between 2022 "October" 1
                            2022 "October" 31) 30)

(define (days-between y1 m1 d1 y2 m2 d2)
  (abs
   (- (year-month-day->days y1 m1 d1)
      (year-month-day->days y2 m2 d2))))