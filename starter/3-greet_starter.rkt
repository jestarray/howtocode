;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 3-greet_starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#| PROBLEM 3: 
Write a function named "greet" that consumes a person and produces string for each person:
"Hi my name is edward norton, I am 18 old and single, my balance is 99"
"Hi my name is marla singer, I am 24 old and taken, my balance is 55"
"Hi my name is tyler durden, I am 18 old and taken, my balance is 0"
|#

(define-struct person (fn ln age balance single))

(define p1 (make-person "edward" "norton" 18 99 #true))
(define p2 (make-person "marla" "singer" 24 55 #false))
(define p3 (make-person "tyler" "durden" 18 0 #false))

;; Person -> String
;; produces a greeting given a person
(define (greet p)
; WRITE CODE INSIDE HERE
    (string-append (... p)))

(greet p1)
(greet p2)
(greet p3)