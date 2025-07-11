;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 10.01-update-bus_starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'update-bus)

#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete
== Data ==
    1. Data Description✅✅
        1B. if using define-struct, write all accessor signatures❌❌
    2. Interpretation✅✅
    3. Data Examples❌❌
    4. A function template that processes this data❌❌
== Functions ==
    1. Signature, purpose, stub ❌
    2. Examples (aka check-expect/tests, elaborate the concrete) ❌
    3. Template(from data)?❌
    4. Code body ❌
    5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
|#

#|PROBLEM A:
Finish the uncompleted steps ❌ of Data Design above for Driver and Bus
|#

(define-struct driver [name route])
; Driver is (make-driver String Number)
; interp.
; name is the name of the driver
; route is the route number the driver knows how to drive

(define-struct bus [seats driver])
; Bus is (make-bus Number Driver)
; interp.
; seats is how many can passengers we can seat
; driver is a who is driving this bus

#|PROBLEM B:
At the end of a bus drivers route, they switch with another driver who know drives the same route.

Desgin a function "update-bus" which only replaces its driver if the given driver can drive the same route
|#

; update-bus: (Bus Driver -> Bus)