;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 5.1-red-x_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
HTDF STEPS: Turn all ❌ into ✅ for each step you complete
    1. Signature, purpose, stub ✅
    2. Examples (aka check-expect, elaborate the concrete) ✅
    3. Template(aka Sketch/Outline) ✅
    4. Code body ✅
    5. Test, review, and refactor(clean up your code! ctrl+i to auto-format) ✅
|#

#| PROBLEM 5: red-x
Design a function named "red-x" that produces an image of a red "X" given a size,
without using (text). HINT: use rectangle and rotate
https://i.imgur.com/g1DpCpt.png
|#
; red-x (Number -> Image)
; produces a red "X" given a size

(check-expect (red-x 20) (overlay
                          (rotate 45 (rectangle 5 20 "solid" "red"))
                          (rotate -45 (rectangle 5 20 "solid" "red"))))

; (define (red-x size) (empty-scene 100 100))
#;
(define (red-x size)
  (... size))

(define (red-x size)
  (overlay
   (rotate 45 (rectangle 5 size "solid" "red"))
   (rotate -45 (rectangle 5 size "solid" "red"))))