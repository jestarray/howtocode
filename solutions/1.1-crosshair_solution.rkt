;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 1.1-crosshair_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;PROBLEM: Use (place-image) to put a crosshair, 
; that is the text of a plus +, on the CENTER of this empty-scene
; https://howtocode.pages.dev/images/center_crosshair.png

; 100 50 is also a valid solution
; letting racket do the division (/ 200 2) for us is overall better
(place-image
 (text "+" 50 "black")
 (/ 200 2)
 (/ 100 2)
 (empty-scene 200 100))