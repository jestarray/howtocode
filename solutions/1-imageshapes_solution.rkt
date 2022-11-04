;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 1-imageshapes_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
; THESE ANSWERS SHOULD RESEMBLE THESE IMAGES RESPECTIVELY:
; https://howtocode.pages.dev/images/shapes.png

; PROBLEM 1: Make a Stop sign using 2htdp/image
; use regular-polygon for the hexagon 🛑
; https://docs.racket-lang.org/teachpack/2htdpimage.html#%28def._%28%28lib._2htdp%2Fimage..rkt%29._regular-polygon%29%29

(overlay
 (text "STOP" 20 "white")
 (regular-polygon 25 8 "solid" "red"))

; PROBLEM 1.1: Make a danger/warning sign with a triangle and an exclamation mark ⚠️

(overlay
 (text "!" 30 "black")
 (triangle 40 "solid" "yellow"))

; PROBLEM 1.2: Make a isosoleces trapezoid

(beside
 (flip-horizontal (right-triangle 30 30 "solid" "red"))
 (square 30 "solid" "red")
 (right-triangle 30 30 "solid" "red"))

; PROBLEM 1.3: Make a traffic light with red, yellow, and green bulbs and a black rectangular background 🚦

(overlay 
 (above 
  (circle 20 "solid" "red")
  (circle 20 "solid" "yellow")
  (circle 20 "solid" "green"))
 (rectangle 50 130 "solid" "black"))

 ; PROBLEM 1.4: Make a red checkerboard pattern

(above 
 (beside (square 20 "solid" "red") (square 20 "solid" "black"))
 (beside (square 20 "solid" "black") (square 20 "solid" "red")))