;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4.4-formalize_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'formalize)
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

#| PROBLEM: formalize
On smartphones, whenever you text someone it will auto-capitalize the first letter of a word, e.g:
"hey guys" -> "Hey guys"
"where u at?" -> "Where u at?"
"wotcha doin" -> "Wotcha doin"
Design a function named 'formalize' that will capitalize the first letter of a sentence
|#
; formalize: (String -> String)
; produces a string capitalizing the first letter
(check-expect (formalize "hey guys") "Hey guys")
(check-expect (formalize "where u at?") "Where u at?")

; template 
; (define (formalize txt)
;    (... txt))

(define (formalize txt)
   (string-append (string-upcase (substring txt 0 1)) (substring txt 1 (string-length txt))))