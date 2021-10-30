;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2.3-checkerboard_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
; PROBLEM 2.3: Checkerboard
; create a function named checkerboard that takes in 3 arguments, size, color1 and color2
; it should produce a checkerboard pattern given a size and two colors
; use the function to create checkerboard patterns of:
    ; 30 red black
    ; 60 purple pink 
    ; 90 green orange
; (refer back to images 1.4 if needed) 
; https://howtocode.pages.dev/images.html#exercise_1_image_shapes

#|
(above 
 (beside (square 20 "solid" "red") (square 20 "solid" "black"))
 (beside (square 20 "solid" "black") (square 20 "solid" "red")))
|#

(define (checkerboard size color1 color2)
    (above 
        (beside (square size "solid" color1) (square size "solid" color2))
        (beside (square size "solid" color2) (square size "solid" color1))))

(checkerboard 30 "red" "black")
(checkerboard 60 "purple" "pink")
(checkerboard 90 "green" "orange")