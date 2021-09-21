; PROBLEM 2.1 trapezoid 
; create a function named "trapezoid" that will take in a "size" parameter
; it's body should produce a trapezoid given size
; (refer back to images 1.2 if needed)

(define (trapezoid size)
  (beside
   (flip-horizontal (right-triangle size size "solid" "red"))
   (square size "solid" "red")
   (right-triangle size size "solid" "red")))