;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4.54-year-month-day-2-date_starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'year-month-day->date)
#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete
== Data ==
    1. Data Description✅
    2. Interpretation✅
    3. Data Examples✅
    4. A function template that processes this data❌
== Functions ==
    1. Signature, purpose, stub ✅
    2. Examples (aka check-expect, elaborate the concrete) ❌
    3. Template(from data)?❌
    3. Code body ❌
    4. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
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

; A MonthFormat is one of:
; - "long"
; - "short"

; A DateOrder is one of:
; - "MDY"
; - "DMY"

#|PROBLEM:
Notice this problem introduces several new data defintions:
"Day", and "Year", and "DateOrder"
with some parts of the design recipe done already.
Finish the template for DateOrder

Copy over the "format-month" function previously done
and use it here to finish this function.
|#

; year-month-day->date : (Year Month Day DateOrder MonthFormat -> String)
; produces a date as a string
; given: 1936 "November" 12 "MDY" "long"   expect: "November 12, 1936"
; given: 1936 "November" 12 "MDY" "short"  expect: "Nov 12, 1936"
; given: 1936 "November" 12 "DMY" "long"   expect: "12 November 1936"
; given: 1936 "November" 12 "DMY" "short"  expect: "12 Nov 1936"