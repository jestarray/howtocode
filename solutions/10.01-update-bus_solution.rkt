;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 10.01-update-bus_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'update-bus)

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
    3. Code body ✅
    4. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#

#|PROBLEM A:
Finish the uncompleted steps ❌ of Data Design above for Driver and Bus
|#

(define-struct driver [name route])
; Driver is (make-driver String Number)
; interp.
; name is the name of the driver
; route is the route number the driver knows how to drive

; driver-name : (Driver -> String)
; driver-route : (Driver -> Number)

(define bob (make-driver "Bob" 1))
(define alice (make-driver "Alice" 1))
(define jack (make-driver "jack" 2))

(define (driver-temp dvr)
  (... (driver-name dvr)
       (driver-route dvr)))

(define-struct bus [route driver])
; Bus is (make-bus String Driver)
; interp.
; name is the brand name of the car
; batt is a reference to Driver

; evcar-name : (Bus -> Name)
; evcar-batt : (Bus -> Driver)

(define bus-r1 (make-bus 1 bob))
(define bus-r2 (make-bus 2 jack))

(define (bus-temp bs)
  (... (bus-route bs) 
       (driver-temp (bus-driver bs))))

#|PROBLEM B:
At the end of a bus drivers route, they switch with another driver who know drives the same route.

Desgin a function "update-bus" which only replaces its driver if the given driver can drive the same route
|#

; update-bus: (Bus Driver -> Bus)
; replaces the driver on the bus with a new driver who can drive the same route
(check-expect (update-bus bus-r1 alice) (make-bus 1 alice))
(check-expect (update-bus bus-r1 jack) (make-bus 1 bob))

(define (update-bus bs dvr)
  (make-bus (bus-route bs) 
            (decide-driver (bus-driver bs) dvr)))

; decide-driver : (Driver Driver -> Driver)
; produces the 2nd given driver if the routes of both drivers are the same
(define (decide-driver curr new)
  (cond
    [(= (driver-route curr) (driver-route new))
     new]
    [else
     curr]))