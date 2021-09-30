(require 2htdp/image)
; PROBLEM 2 red-oct
; Create a function who's name is "red-octogon" with a parameter named "size", 
; and in the body it should produce a red octogon of varying size.
; use it to create red octogons of size 30 60 90
; (regular-polygon size 8 "solid" "red")

; if we make a function instead, we can give it a meaningful name and vary the value
; use check-syntax and the stepper to see what size is substituted for.
(define (red-octogon size)
; body will replace all instances of size with what we pass in
    (regular-polygon size 8 "solid" "red")) 

; we can create red octogons without needing to type solid red
; the argument, aka parameter/operand makes it easy to vary the size
; we can also understand immediately what this will create
(red-octogon 30)
(red-octogon 60)
(red-octogon 90)