; PROBLEM 2.2: Checkerboard
; create a function named checkerboard that takes in 2 arguments, color1 and color2
; it should produce a checkerboard pattern given the two colors
; (refer back to images 1.4 if needed)

(define (checkerboard color1 color2)
    (above 
        (beside (square 40 "solid" color1) (square 40 "solid" color2))
        (beside (square 40 "solid" color2) (square 40 "solid" color1))))