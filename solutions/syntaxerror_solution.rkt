;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname syntaxerror_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; (<operator> <argument-1> <argument-2> ...)
; PROBLEM: each line of code contains errors try and fix em
; comment out line if you don't know how
; use the cheatsheet:
; https://howtocode.pages.dev/cheatsheet.html

; missing parts, we can only presume that
; (+ 1 1) needs to be outside the or
(if (or (or #true #false) (and #true #false)) (+ 1 1) (+ 4 2))

; too many parenthesis
; missing closing parens 
(define v "name")
; too many parentheses
(cond [(string=? v "name") #true])

; too many parens, 8 is not an operation
(+ 4 4)

; string-append cannot take a number
; so you have to convert it
(string-append "I am " (number->string 21) " years old")

; to little parens, + only takes numbers
(+ 1 5 (- 3 9))

(define fx (+ 1 2 1))

; this is not a function
fx 

; someone accidently wrapped the function call
(define (g a)
  (+ a 1))

(g 5)