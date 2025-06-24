#lang pollen

◊h1{How to Design Functions Example}

◊h2{Double a number}
◊racket-code-block{
;; PROBLEM: Write a function double that produces double of a number

;; 1. Function Description (signature, purpose, stub)

; double: (Number -> Number)
; produces 2 times the given number
; (define (double n) 0) ; make sure stub matches the signature! Used to make sure the tests run

;; 2. Functional Examples (aka tests, elaborate the concrete)
(check-expect (double 2) 4)
(check-expect (double 3) 9) ; the test is wrong here 
(check-expect (double 1.3) (* 2 1.3))

;; 3. Template/Sketch/Outline
; (define (double n)
;    (... n))

;; 4. Code
(define (double n)
    (* 2 n))

;; 5. Test, review, and refactor(ctrl+i to auto format code, clean up)
}

◊h2{Inches to Centimeters}
◊racket-code-block{
;; PROBLEM: Write a function double that produces double of a number
;; requires domain knowledge, look up the formula!!

;; 1. Function Description (signature, purpose, stub)

; inches->centi: (Number -> Number)
; converts units in iches to centimeters
; (define (inches->centi n) 0) ; make sure stub matches the signature! Used to make sure the tests run

;; 2. Functional Examples (aka tests, elaborate the concrete)
(check-expect (inches->centi 2) (* 2 2.54))
(check-expect (inches->centi 1.3) (* 1.3 2.54))

;; 3. Template/Sketch/Outline
; (define (inches->centi n)
;    (... n))

;; 4. Code
(define (inches->centi n)
    (* 2.54 n))

;; 5. Test, review, and refactor(ctrl+i to auto format code, clean up)
}

◊h2{Fahrenheit to Celsius}
◊racket-code-block{
;; PROBLEM: Write a function that converts fahrenheit to celcius
;; requires domain knowledge, look up the formula!!
; °C = (°F - 32) x 5/9 

;; 1. Function Description (signature, purpose, stub)

; fah->cel: (Number -> Number)
; converts a given tempature measured in fahrenheit to celsius
; (define (fah->cel n) 0) ; make sure stub matches the signature! Used to make sure the tests run

;; 2. Functional Examples (aka tests, elaborate the concrete)
(check-expect (fah->cel 113) 46)

;; 3. Template/Sketch/Outline
; (define (fah->cel n)
;    (... n))

;; 4. Code
(define (fah->cel n)
    (* (- n 32) (/ 5 9)))

;; 5. Test, review, and refactor(ctrl+i to auto format code, clean up)
}