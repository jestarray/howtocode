;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 5-image-area_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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

#| PROBLEM 5: image-area 
Design a function that consumes an image and produces the area of that image, e.g how many pixels it takes up. Note: The formula for area is width * height
|#

; image-area: (Image -> Number)
; produces how many pixels an image occupies on the screen

(check-expect (image-area (square 5 "solid" "red")) 25)
(check-expect (image-area (rectangle 2 4 "solid" "red")) 8)
; (define (image-area img) 0)

; template
; (define (image-area img)
;    (... img))

(define (image-area img)
    (* (image-width img) (image-height img)))