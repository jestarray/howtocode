;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 10.02-update-battery_starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'update-battery)

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
Finish the uncompleted steps ❌ of Data Design above for Battery and EVCar
|#

(define-struct battery [id charge])
; Battery is (make-battery Number Number)
; interp.
; id is a unique part number the car will check if it is compatible
; charge is the percentage charge of the battery


(define-struct evcar [name batt])
; EVCar is (make-evcar String Battery)
; interp.
; name is the brand name of the car
; batt is a reference to Battery


#|PROBLEM B:
In some parts of China, there are EV battery swapping stations! The battery swap should only happen if the id number of the current cars battery and the new battery matches AND if the new battery has more charge than the one being replaced

Write a function "update-battery" that consumes an EvCar and a Battery and produces the car with the potentially replaced battery
|#

; update-battery : (EVCar Battery -> EVCar)