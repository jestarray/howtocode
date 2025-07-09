;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 9.01-need-maintance_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'need-maintance)

#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete
== Data ==
    1. Data Description✅✅
        1B. if using define-struct, write all accessor signatures✅✅
    2. Interpretation✅✅
    3. Data Examples✅✅
    4. A function template that processes this data✅✅
== Functions ==
    1. Signature, purpose, stub ✅
    2. Examples (aka check-expect/tests, elaborate the concrete) ✅
      2B. if the function consumes a list, make sure a list of 2 or longer is tested
    3. Template(from data)?✅
    3. Code body ✅
    4. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#


#|PROBLEM A:
Finish the uncompleted steps ❌ of Data Design above for both Engine and Vehicle
|#

(define-struct engine [horsepower oil-life check-light])
; Engine is (make-engine Number Number Boolean)
; interp. a car engine
; horsepower is poweroutput of the engine
; oil-life is [0-100] representing the percentage of oil left
; check-light indicates the engine has a problem
(define nocheck-10% (make-engine 2000 10 #false))
(define check-10% (make-engine 2000 10 #true))

(define check-5% (make-engine 2000 5 #true))
(define nocheck-5% (make-engine 2000 5 #false))
(define nocheck-40% (make-engine 2000 40 #false))
(define check-40% (make-engine 2000 40 #true))

; engine-horsepower : (Engine -> Number)
; engine-oil-life: (Engine -> Number)
; engine-check-light: (Engine -> Boolean)

(define (engine-temp eng)
  (... (engine-horsepower eng)
       (engine-oil-life eng)
       (engine-check-light eng)))

(define-struct vehicle [brand engine])
; Vehicle is (make-vehicle String Engine)
; interp.
; brand is the name of the brand, e.g toyota, etc
; engine is a reference to Engine
(define honda (make-vehicle "Honda" nocheck-10%))
(define toyota (make-vehicle "Toyota" check-10%))

(define byd (make-vehicle "BYD" check-5%))
(define volvo (make-vehicle "Volvo" nocheck-5%))
(define xpeng (make-vehicle "Xpeng" nocheck-40%))
(define nio (make-vehicle "NIO" check-40%))

; vehicle-brand : (Vehicle -> String)
; vehicle-engine : (Vehicle -> Engine)

(define (vehicle-temp vh)
  (...
   (vehicle-brand vh)
   (engine-temp (vehicle-engine vh))))

#|PROBLEM B:
You are working at a car company and they want you to design code that detects when a vehicle needs maintance.
A vehicle neeeds maintance when the oil life is less than or equal to 10% or the check light is on
Design the function "need-maintance?" that consumes a Vehicle to provide the purpose above
|#

(check-expect (need-maintance? honda) #true)
(check-expect (need-maintance? toyota) #true)
(check-expect (need-maintance? byd) #true)
(check-expect (need-maintance? volvo) #true)
(check-expect (need-maintance? xpeng) #false)
(check-expect (need-maintance? nio) #true)

; need-maintance? (Vehicle -> Boolean)
; produce #true if the given vehicle has 10% oil life or check light is on
;(define (need-maintance? vh) #false)
(define (need-maintance? vh)
  (light-or-10%? (vehicle-engine vh)))

; light-or-10%? : (Engine -> Boolean)
; produce #true if the given engine has 10% oil life or check light is on
(define (light-or-10%? eng)
  (or (<= (engine-oil-life eng) 10)
      (engine-check-light eng)))
