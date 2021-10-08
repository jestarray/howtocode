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