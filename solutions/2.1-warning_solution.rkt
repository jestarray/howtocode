(require 2htdp/image)
; PROBLEM 2.1 Warning Sign 
; create a function named "warning-sign" that will take in a "size" parameter
; its should produce a warning-sign given the size
; use the function to create warning signs of size 30 60 90
; (refer back to images 1.1 if needed) 
; https://howtocode.pages.dev/images.html#exercise_1_image_shapes

#|
(overlay
 (text "!" 30 "black")
 (triangle 40 "solid" "yellow"))
|#

(define (warning-sign size)
    (overlay 
        (text "!" size "black")
        (triangle size "solid" "yellow")))

(warning-sign 30)
(warning-sign 60)
(warning-sign 90)