;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4.2-string-rest_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
HTDF STEPS: Turn all ❌ into ✅ for each step you complete
    1. Signature, purpose, stub ✅
    2. Examples (aka check-expect, elaborate the concrete) ✅
    3. Template(aka Sketch/Outline) ✅
    4. Code body ✅
    5. Test, review, and refactor(clean up your code! ctrl+i to auto-format) ✅
|#

#| PROBLEM 4.2: string-rest
Design the function string-rest, which produces a string like the given one with the first character removed.
|#

; string-rest: (String -> String)
; produces the given string with the first character removed
(check-expect (string-rest "woah") "oah")
(check-expect (string-rest "omg") "mg")
; (define (string-rest st) "")

(define (string-rest st)
  (substring st 1 (string-length st)))