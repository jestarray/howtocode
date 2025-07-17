;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 11.01-shipping-cost_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'shipping-cost)

#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete
== Data ==
    1. Data Description✅
        1B. if using define-struct, write all accessor signatures✅
    2. Interpretation✅
    3. Data Examples✅
    4. A function template that processes this data✅
== Functions ==
    1. Signature, purpose, stub ✅
    2. Examples (aka check-expect/tests, elaborate the concrete) ✅
    3. Template(from data)?✅
    4. Code body ✅
    5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#

#|PROBLEM A:
Notice the Data Definitions for Standard, Express, and International
Finish the uncompleted steps ❌ of Data Design above for "ShippingMethod"(examples and template)
|#

(define-struct standard [weight])
; Standard is (make-standard Number)
; interp. represents a package sent via standard charge

; standard-weight : (Standard -> Number)

; standard-temp : (Standard -> ???)
(define (standard-temp stan)
  (... (standard-weight stan)))

(define-struct express [weight distance])
; Express is (make-express Number Number)
; interp. represents a package sent via express charge
; distance is far to destination, which will be used incurr extra charges

; express-weight : (Express -> Number)
; express-distance : (Express -> Number)

; express-temp : (Express -> ???)
(define (express-temp exp)
  (... (express-weight exp) (express-distance exp)))

(define-struct international [weight distance])
; International is (make-international Number Number)
; interp. represents a package sent via international charge
; distance is far to destination, which will be used incurr extra charges

; international-weight : (Express -> Number)
; international-distance : (Express -> Number)

; international-temp : (International -> ???)
(define (international-temp exp)
  (... (international-weight exp) (international-distance exp)))

; union ShippingMethod is one of:
; - (make-standard Number)
; - (make-express Number Number)
; - (make-international Number Number)
; interp. A set of shipping methods

(define stan1 (make-standard 23))
(define exp1 (make-express 33 21))
(define inter1 (make-international 40 33))

; shippingmethod-temp : (ShippingMethod -> ???)
(define (shippingmethod-temp sm)
  (cond
    [(standard? sm)
     (... (standard-weight sm))]
    [(express? sm)
     (... (express-weight sm) (express-distance sm))]
    [(international? sm)
     (... (international-weight sm) (international-distance sm))]))

#|PROBLEM B:
Design a function "shipping-cost" that consumes a "ShippingMethod"
and produces the cost of the given shipping with the following formulas:

standard: weight * 1
express: weight * (distance * 2)
international: weight * (distance * 5)
|#

; shipping-cost : (ShippingMethod -> Number)
; interp. produces the price of what is being shipped via:
; standard: weight * 1
; express: weight * (distance * 2)
; international: weight * (distance * 5)

(check-expect (shipping-cost stan1) (* 23 1))
(check-expect (shipping-cost exp1) (+ 33 (* 21 2)))
(check-expect (shipping-cost inter1) (+ 40 (* 33 5)))
;(define (shipping-cost sh) 0)

(define (shipping-cost sm)
  (cond
    [(standard? sm)
     (* (standard-weight sm) 1)]
    [(express? sm)
     (+ (express-weight sm) (* (express-distance sm) 2))]
    [(international? sm)
     (+ (international-weight sm) (* (international-distance sm) 5))]))