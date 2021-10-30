;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 5.2-cancel_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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

#| PROBLEM 5.2: cancel
Design a function that puts a red-x over an image indicating it is canceled.
You may want to re-use your code from "red-x"
|#

; red-x (Number -> Image)
; produces a red "X" given a size
(define (red-x size)
  (overlay
   (rotate 45 (rectangle 5 size "solid" "red"))
   (rotate -45 (rectangle 5 size "solid" "red"))))

; cancel: (Image -> Image)
; produces a given image with red-x on top
(check-expect (cancel (text "todays party" 100 "black"))
              (overlay
               (red-x (image-width (text "todays party" 100 "black")))
               (text "todays party" 100 "black")))

; (define (cancel img) (empty-scene 100 100))

(define (cancel img)
  (overlay
   (red-x (image-width img))
   img))