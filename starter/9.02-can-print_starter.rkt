;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 9.02-can-print_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'can-print)

#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete
== Data ==
    1. Data Description✅✅
        1B. if using define-struct, write all accessor signatures❌❌
    2. Interpretation✅✅
    3. Data Examples❌❌
    4. A function template that processes this data❌❌
== Functions ==
    1. Signature, purpose, stub ❌
    2. Examples (aka check-expect/tests, elaborate the concrete) ❌
    3. Template(from data)?❌
    4. Code body ❌
    5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
|#


#|PROBLEM A:
Finish the uncompleted steps ❌ of Data Design above for both Ink and Printer
|#

(define-struct ink [amount color])
; Ink is (make-ink Number String)
; interp.
; amount is the percentage of ink left in the cartridge
; color is the name of a color

(define-struct printer [name paper ink])
; Printer is (make-printer String Number Ink)
; interp.
; name is the brand of the printer
; paper is the amount of paper left
; ink is a reference to Ink, representing the cartiage


#|PROBLEM B:
A printer needs at least 1 piece of paper and 1% of ink in order to print.
Design a function "can-print?" that consumes a Printer and provides the given purpose above.
|#

; can-print? : (Printer -> Boolean)