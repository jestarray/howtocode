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
        1B. if using define-struct, write all accessor signatures✅✅
    2. Interpretation✅✅
    3. Data Examples✅✅
    4. A function template that processes this data✅✅
== Functions ==
    1. Signature, purpose, stub ✅
    2. Examples (aka check-expect/tests, elaborate the concrete) ✅
    3. Template(from data)?✅
    4. Code body ✅
    5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#


#|PROBLEM A:
Finish the uncompleted steps ❌ of Data Design above for both Ink and Printer
|#

(define-struct ink [amount color])
; Ink is (make-ink Number String)
; interp.
; amount is the percentage of ink left in the cartridge
; color is the name of a color

; ink-amount : (Ink -> Number)
; ink-color : (Ink -> String)
(define full-black (make-ink 100 "black"))
(define empty-red (make-ink 0 "red"))
(define one%-blue (make-ink 1 "blue"))

(define (ink-temp in)
  (... (ink-amount in) ... (ink-color in)))

(define-struct printer [name paper ink])
; Printer is (make-printer String Number Ink)
; interp.
; name is the brand of the printer
; paper is the amount of paper left
; ink is a reference to Ink, representing the cartiage

; printer-name : (Printer -> String)
; printer-paper : (Printer -> Number)
; printer-ink: (Printer -> Ink)
(define hp (make-printer "HP" 0 full-black))
(define brother (make-printer "Brother" 1 empty-red))
(define dell (make-printer "Dell" 2 full-black))
(define canon (make-printer "Canon" 0 empty-red))

(define (printer-temp pr)
  (... (printer-name pr) ... (printer-paper pr) ... 
       (ink-temp (printer-ink pr))))

#|PROBLEM B:
A printer needs at least 1 piece of paper and 1% of ink in order to print.
Design a function "can-print?" that consumes a Printer and provides the given purpose above.
|#

; can-print? : (Printer -> Boolean)
; produce #true if there is at least 1 paper in the printer and 1% of ink
(check-expect (can-print? hp) #false)
(check-expect (can-print? brother) #false)
(check-expect (can-print? dell) #true)
(check-expect (can-print? canon) #false)

; (define (can-print? pr) #false)

(define (can-print? pr)
  (and (>= (printer-paper pr) 1) (has-ink? (printer-ink pr))))

; has-ink? : (Ink -> Boolean)
; produces #true if there is 1 or more in amount
(check-expect (has-ink? full-black) #true)
(check-expect (has-ink? empty-red) #false)
(check-expect (has-ink? one%-blue) #true)

;(define (has-ink? in) #false)

(define (has-ink? in)
  (>= (ink-amount in) 1))