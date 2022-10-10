;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname image-larger_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(define PNAME 'image-larger?)
#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
HTDF STEPS: Turn all ❌ into ✅ for each step you complete
    1. Signature, purpose, stub ✅
    2. Examples (aka check-expect, elaborate the concrete) ✅
    3. Template(aka Sketch/Outline) ✅
    4. Code body ✅
    5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#

#| PROBLEM: 
Design a function named 'image-larger?' that consumes two images and produces whether the first given 
image is larger than the second
|#

; image-area: Image -> Number
; produces the area of the given image
(define (image-area img)
    (* (image-width img) (image-height img)))

; image-larger?: Image Image -> Boolean
; produces true if the area of the first image is bigger than the second image

(check-expect (image-larger? (rectangle 4 4 "solid" "red") (rectangle 4 4 "solid" "red")) #false)
(check-expect (image-larger? (rectangle 7 4 "solid" "red") (rectangle 4 4 "solid" "red")) #true)
(check-expect (image-larger? (rectangle 4 4 "solid" "red") (rectangle 7 4 "solid" "red")) #false)

#;
(define (image-larger? img1 img2)
    (... img1 img2))

; working solution but can do better!
#;
(define (image-larger? img1 img2)
    (> (* (image-width img1) (image-height img1)) (* (image-width img2) (image-height img2))))

; better solution, make a helper function 'image-area'
(define (image-larger? img1 img2)
    (> (image-area img1) (image-area img2)))