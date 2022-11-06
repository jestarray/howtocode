;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4.52-abbrev-month_starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'abbrev-month)
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
    3. Code body ❌
    4. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
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
Design the function "abbrev-month" that produces the next month
after the given one. For example:
given "September" produce "Sep"
given "January" produce "Jan"

HINT: consider using substring
|#

; abbrev-month: (Month -> String)
; produces the abbreviated version of the month
(check-expect (abbrev-month "Janurary") "Jan")
(check-expect (abbrev-month "February") "Feb")
(check-expect (abbrev-month "March") "Mar")
(check-expect (abbrev-month "April") "Apr")
(check-expect (abbrev-month "May") "May")
(check-expect (abbrev-month "June") "Jun")
(check-expect (abbrev-month "July") "Jul")
(check-expect (abbrev-month "August") "Aug")
(check-expect (abbrev-month "September") "Sep")
(check-expect (abbrev-month "October") "Oct")
(check-expect (abbrev-month "November") "Nov")
(check-expect (abbrev-month "December") "Dec")

(define (abbrev-month m)
  (cond
    [(string=? m "Janurary") "Jan"]
    [(string=? m "February") "Feb"]
    [(string=? m "March") "Mar"]
    [(string=? m "April") "Apr"]
    [(string=? m "May") "May"]
    [(string=? m "June") "Jun"]
    [(string=? m "July") "Jul"]
    [(string=? m "August") "Aug"]
    [(string=? m "September") "Sep"]
    [(string=? m "October") "Oct"]
    [(string=? m "November") "Nov"]
    [(string=? m "December") "Dec"]))

(define (abbrev-month-OPTIMAL m)
  (substring m 0 3))