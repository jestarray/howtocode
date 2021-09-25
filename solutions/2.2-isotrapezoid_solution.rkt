; PROBLEM 2.2 trapezoid 
; create a function named "trapezoid" that will take in a "size" parameter
; it should produce a trapezoid given a size
; use the function to create trapezoids of sizes 30 60 90
; (refer back to images 1.2 if needed) https://howtocode.pages.dev/images.html#exercise_1_image_shapes

(define (trapezoid size)
  (beside
   (flip-horizontal (right-triangle size size "solid" "red"))
   (square size "solid" "red")
   (right-triangle size size "solid" "red")))


(trapezoid 30)
(trapezoid 60)
(trapezoid 90)