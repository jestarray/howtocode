;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2.2-isotrapezoid_starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
; PROBLEM 2.2 trapezoid 
; create a function named "trapezoid" that will take in a "size" parameter
; it should produce a trapezoid given a size
; use the function to create trapezoids of sizes 30 60 90
; (refer back to images 1.2 if needed) 
; https://howtocode.pages.dev/images.html#exercise_1_image_shapes

#|
(beside
 (flip-horizontal (right-triangle 30 30 "solid" "red"))
 (square 30 "solid" "red")
 (right-triangle 30 30 "solid" "red"))
|#