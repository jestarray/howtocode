;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4.53-format-month_starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'format-month)
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
    2. Examples (aka check-expect, elaborate the concrete) ✅
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

; A MonthFormat is one of:
; - "long"
; - "short"

(define (month-format-temp mf)
  (cond
    [(string=? mf "long") ...]
    [(string=? mf "short") ...]))

#|PROBLEM:
Notice this problem introduces the "MonthFormat" data defintion
with some parts of the design recipe done already. Finish the template.

Design the function "format-month" that when given "short",
produces the abbreviated name of the month, "long" otherwise.

Copy over the "abbrev-month" function you wrote
in the previous exercise and use it as part of your solution.
|#

; abbrev-month: (Month -> String)
; produces the abbreviated version of the month
; (check-expect (abbrev-month "Janurary") "Jan")
(define (abbrev-month m)
  (substring m 0 3))

; format-month : (Month MonthFormat -> String)
; abbreviates Month to three letters or not based on MathFormat
(check-expect (format-month "January" "short") "Jan")
(check-expect (format-month "February" "short") "Feb")
(check-expect (format-month "March" "short") "Mar")
(check-expect (format-month "April" "short") "Apr")
(check-expect (format-month "May" "short") "May")
(check-expect (format-month "June" "short") "Jun")
(check-expect (format-month "July" "short") "Jul")
(check-expect (format-month "August" "short") "Aug")
(check-expect (format-month "September" "short") "Sep")
(check-expect (format-month "October" "short") "Oct")
(check-expect (format-month "November" "short") "Nov")
(check-expect (format-month "December" "short") "Dec")

(check-expect (format-month "January" "long") "January")
(check-expect (format-month "February" "long") "February")
(check-expect (format-month "March" "long") "March")
(check-expect (format-month "April" "long") "April")
(check-expect (format-month "May" "long") "May")
(check-expect (format-month "June" "long") "June")
(check-expect (format-month "July" "long") "July")
(check-expect (format-month "August" "long") "August")
(check-expect (format-month "September" "long") "September")
(check-expect (format-month "October" "long") "October")
(check-expect (format-month "November" "long") "November")
(check-expect (format-month "December" "long") "December")

; (define (format-month month form))

(define (format-month month form)
  (cond
    [(string=? form "long") month]
    [(string=? form "short") (abbrev-month month)]))