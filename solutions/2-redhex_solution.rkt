; PROBLEM 2 red-hex
; Create a function who's name is "red-hexagon" with a parameter named "size", 
; and in the body it should produce a red hexagon of varying size.

; if we make a function instead, we can give it a meaningful name and vary the value
; use check-syntax and the stepper to see what size is substituted for.
(define (red-hexagon size)
; body will replace all instances of size with what we pass in
    (regular-polygon size 8 "solid" "red")) 

; we can create red hexagons without needing to type solid red
; the argument, aka parameter/operand makes it easy to vary the size
; we can also understand immediately what this will create
(red-hexagon 30)
(red-hexagon 60)
(red-hexagon 90)