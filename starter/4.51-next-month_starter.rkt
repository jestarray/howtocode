;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4.51-next_month_starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'next-month)
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
    1. Signature, purpose, stub ❌
    2. Examples (aka check-expect, elaborate the concrete) ❌
    3. Template(from data)?❌
    4. Code body ❌
    5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
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

#|PROBLEM:
Notice how the data design recipe has been done.

Design the function "next-month" that produces the next month
after the given one. For example:
given "November" produce "December"
given "December" produce "Janurary"
given "Janurary" produce "February"

HINT: Use the month-temp as a starter
|#