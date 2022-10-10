;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4.0-less-than-5_starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'less-than-5?)
#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
HTDF STEPS: Turn all ❌ into ✅ for each step you complete
    1. Signature, purpose, stub ✅
    2. Examples (aka check-expect, elaborate the concrete) ✅
    3. Template(aka Sketch/Outline) ✅
    4. Code body ✅
    5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#

#| PROBLEM: less-than-5?
Design a function named 'less-than-5?' that determines if a strings length is less than 5
|#

; less-than-5: (String -> Boolean)
; produces true whether the length of the string is less than 5

(check-expect (less-than-5? "bob") #true)
(check-expect (less-than-5? "meow") #true)
(check-expect (less-than-5? "steam") #false)
(check-expect (less-than-5? "hungry") #false)

#;
(define (less-than-5? str)
    (... str))

(define (less-than-5? str)
    (< (string-length str) 5))