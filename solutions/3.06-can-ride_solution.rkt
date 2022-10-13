;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname can-ride) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'can-ride)
#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
HTDF STEPS: Turn all ❌ into ✅ for each step you complete
    1. Signature, purpose, stub ❌
    2. Examples (aka check-expect, elaborate the concrete) ❌
    3. Template(aka Sketch/Outline) ❌
    4. Code body ❌
    5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
|#

#| PROBLEM:
Design a function 'can-ride?' that consumes an age and whether or not said person is with an
adult, and determines if a person can ride the rollercoaster. You can only ride it if you are 
12 or older or have an adult with you!
|#

; can-ride?: (Number Boolean) -> Boolean
; produces true if age is greater than 12 or if you have an adult with you

(check-expect (can-ride? 13 #true) #true)
(check-expect (can-ride? 13 #false) #true)
(check-expect (can-ride? 12 #true) #true)
(check-expect (can-ride? 12 #false) #true)
(check-expect (can-ride? 11 #false) #false)
(check-expect (can-ride? 11 #true) #true)

#;
(define (can-ride? age with-adult)
    (... age with-adult))

(define (can-ride? age with-adult)
    (or (>= age 12) with-adult))