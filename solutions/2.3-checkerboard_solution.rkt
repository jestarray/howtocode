; PROBLEM 2.3: Checkerboard
; create a function named checkerboard that takes in 3 arguments, size, color1 and color2
; it should produce a checkerboard pattern given a size and two colors
; use the function to create checkerboard patterns of:
    ; 30 red black
    ; 60 purple pink 
    ; 90 green orange
; (refer back to images 1.4 if needed)

(define (checkerboard size color1 color2)
    (above 
        (beside (square size "solid" color1) (square size "solid" color2))
        (beside (square size "solid" color2) (square size "solid" color1))))

(checkerboard 30 "red" "black")
(checkerboard 60 "purple" "pink")
(checkerboard 90 "green" "orange")