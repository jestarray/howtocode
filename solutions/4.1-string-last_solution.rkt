;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4.1-string-last_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
HTDF STEPS: Turn all ❌ into ✅ for each step you complete
    1. Signature, purpose, stub ✅
    2. Examples (aka check-expect, elaborate the concrete) ✅
    3. Template(aka Sketch/Outline) ✅
    4. Code body ✅
    5. Test, review, and refactor(clean up your code! ctrl+i to auto-format) ✅
|#

#| PROBLEM 4.1: string-last
Design the function string-last, which extracts the last character from a non-empty string.
|#

; string-last: (String -> String)
; extracts the last character from a non-empty string
(check-expect (string-last "ah") "h")
(check-expect (string-last "barn") "n")
; stub (define (string-last st) "")

(define (string-last st)
  (substring st (sub1 (string-length st))))