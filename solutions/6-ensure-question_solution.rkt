;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6-ensure-question_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
HTDF STEPS: Turn all ❌ into ✅ for each step you complete
    1. Signature, purpose, stub ✅
    2. Examples (aka check-expect, elaborate the concrete) ✅
    3. Template(aka Sketch/Outline) ✅
    4. Code body ✅
    5. Test, review, and refactor(clean up your code! ctrl+i to auto-format) ✅
|#

#| PROBLEM 6: ensure-question
Design a function that consumes a string, and adds "?" 
to the end unless the string already ends in "?".
|#

; ensure-question (String -> String)
; add ? to end of str unless it already ends in ?
(check-expect (ensure-question "Hello") "Hello?")
(check-expect (ensure-question "OK?") "OK?")

;(define (ensure-question str) ;stub
;  "str")

;(define (ensure-question str) ; template
;  (... str))

(define (ensure-question str)
  (if (string=? (substring str (- (string-length str) 1)) "?")
      str
      (string-append str "?")))