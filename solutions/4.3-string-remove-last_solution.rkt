;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4.3-string-remove-last_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
HTDF STEPS: Turn all ❌ into ✅ for each step you complete
    1. Signature, purpose, stub ✅
    2. Examples (aka check-expect, elaborate the concrete) ✅
    3. Template(aka Sketch/Outline) ✅
    4. Code body ✅
    5. Test, review, and refactor(clean up your code! ctrl+i to auto-format) ✅
|#

#| PROBLEM 4.3: string-remove-last
Design the function string-remove-last, which produces a string like the given one with the last character removed.
|#

; string-remove-last: (String -> String)
; produce a given string with the last character removed
(check-expect (string-remove-last "hello") "hell")
(check-expect (string-remove-last "cat") "ca")
; stub (define (string-remove-last st) "")

(define (string-remove-last st)
  (substring st 0 (sub1 (string-length st))))