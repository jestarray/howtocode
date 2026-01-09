;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 5.4-formalize_starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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

; ############################################################################

#| PROBLEM: formalize
We have provided helper functions: string-first, string-rest, from the previous problem, use them!

On smartphones, whenever you text someone it will auto-capitalize the first letter of a word, e.g:
"hey guys" -> "Hey guys"
"where u at?" -> "Where u at?"
"wotcha doin" -> "Wotcha doin"
Design a function named 'formalize' that will capitalize the first letter of a sentence. Assume that 
a string is not empty.
|#

; string-first: (String -> String)
; extracts the first character from a non-empty-string
(define (string-first st)
  (substring st 0 1))

; string-rest: (String -> String)
; produces the given string with the first character removed
(define (string-rest st)
  (substring st 1 (string-length st)))