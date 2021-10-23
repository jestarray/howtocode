;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4-formalize_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#| PROBLEM 4: Formalize
On smartphones, whenever you text someone it will auto-capitalize the first letter of a word, e.g:
"hey guys" -> "Hey guys"
"oh no she didn't" -> "Oh no she didn't"
"where u at?" -> "Where u at?"
Write a function that will capitalize the first letter of a sentence
|#

#|
HTDF STEPS: Turn all ❌ into ✅ for each step you complete
    1. Signature, purpose, stub ✅
    2. Examples (aka check-expect, elaborate the concrete) ✅
    3. Template(aka Sketch/Outline) ✅
    4. Code body ✅
    5. Test, review, and refactor(clean up your code! ctrl+i to auto-format) ✅
|#

; formalize: (String -> String)
; produces a string capitalizing the first letter
; (define (formalize txt) "") stub
(check-expect (formalize "hey guys") "Hey guys")
(check-expect (formalize "where u at?") "Where u at?")

; template 
; (define (formalize txt)
;    (... txt))

(define (formalize txt)
   (string-append (string-upcase (substring txt 0 1)) (substring txt 1 (string-length txt))))