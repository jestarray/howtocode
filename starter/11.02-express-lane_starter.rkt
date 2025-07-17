;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 11.02-express-lane_starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'express-lane)

#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete
== Data ==
    1. Data Description✅
        1B. if using define-struct, write all accessor signatures✅
    2. Interpretation✅
    3. Data Examples❌
    4. A function template that processes this data❌
== Functions ==
    1. Signature, purpose, stub ❌
    2. Examples (aka check-expect/tests, elaborate the concrete) ❌
    3. Template(from data)?❌
    4. Code body ❌
    5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
|#

#|PROBLEM A:
Notice the Data Definitions for Car, Truck, and Motorcycle are done.
Finish the uncompleted steps ❌ of Data Design above for "Vehicle"(examples and template)
|#

(define-struct gas-car [passengers])
; GasCar is (make-gas-car Number)
; interp. represents a gas car and amount of passengers

; gas-car-passengers : (GasCar -> Number)

(define (gas-car-temp gcar)
  (... (gas-car-passengers gcar)))

(define-struct truck [cargo-weight])
; Truck is (make-truck Number)
; interp. represents a truck with its cargo weight

; truck-cargo-weight : (Truck -> Number)

(define (truck-temp trk)
  (... (truck-cargo-weight trk)))

(define-struct motorcycle [])
; Motorcylce is (make-motorcyle)
; interp. represents a motorcycle

(define (motorcycle-temp mcycle)
  (...))

; union Vehicle is one of:
; - (make-gas-car Number)
; - (make-truck Number)
; - (make-motorcycle)
; interp. a set of vehicles

; TODO: 3. Examples and 4.Template

#|PROBLEM B:
Design a function "can-express-lane?" that consumes a "Vehcile".
Motorcycles can always use the express lane.
Cars only with 2 or more passengers can use the express lane.
Trucks always cannot use the express lane.
|#

; can-express-lane? : (Vehicle -> Boolean)