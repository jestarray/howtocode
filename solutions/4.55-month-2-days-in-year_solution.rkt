;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4.55-month-2-days-in-year_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'month->days-in-year)
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

; ############################################################################

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

; A Day is an integer at least 1 but at most 31
; Examples:
;   1
;   10
;   31
; Non-examples:
;   32
;   "today"

#|PROBLEM:

Domain:
+============+======+
|   Month    | Days |
+============+======+
| January    |   31 |
+------------+------+
| February   |   28 |
+------------+------+
| March      |   31 |
+------------+------+
| April      |   30 |
+------------+------+
| May        |   31 |
+------------+------+
| June       |   30 |
+------------+------+
| July       |   31 |
+------------+------+
| August     |   31 |
+------------+------+
| September  |   30 |
+------------+------+
| October    |   31 |
+------------+------+
| November   |   30 |
+------------+------+
| December   |   31 |
+------------+------+

Notice how some elements of the design recipe
have been completed. Finish the design of
the "month->days-in-year" below.

HINT: Use the "month-temp"
|#

; month->days-in-year : Month -> Number
; returns the days elapsed in the start of the year 
; **before** the given month
; given: "January"    expect: 0
; given: "February"    expect: 31
; given: "March"    expect: 59
; given: "September"  expect: 243

(check-expect (month->days-in-year "January") 0)
(check-expect (month->days-in-year "February") 31)
(check-expect (month->days-in-year "March") 59)
(check-expect (month->days-in-year "April") 90)
(check-expect (month->days-in-year "May") 120)
(check-expect (month->days-in-year "June") 151)
(check-expect (month->days-in-year "July") 181)
(check-expect (month->days-in-year "August") 212)
(check-expect (month->days-in-year "September") 243)
(check-expect (month->days-in-year "October") 273)
(check-expect (month->days-in-year "November") 304)
(check-expect (month->days-in-year "December") 334)

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