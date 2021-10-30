;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4-string-first_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
HTDF STEPS: Turn all ❌ into ✅ for each step you complete
    1. Signature, purpose, stub ✅
    2. Examples (aka check-expect, elaborate the concrete) ✅
    3. Template(aka Sketch/Outline) ✅
    4. Code body ✅
    5. Test, review, and refactor(clean up your code! ctrl+i to auto-format) ✅
|#

#| PROBLEM 4: string-first
Design the function string-first, which extracts the first character from a non-empty string. Don’t worry about empty strings
|#

; string-first: (String -> String)
; extracts the first character from a non-empty-string

(check-expect (string-first "boo") "b")
(check-expect (string-first "dog") "d")
; stub (define (string-first st) "")

(define (string-first st)
  (substring st 0 1))