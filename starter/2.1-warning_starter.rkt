;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2.1-warning_starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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