;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 10.02-update-battery_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'update-battery)

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
      2B. if the function consumes a list, make sure a list of 2 or longer is tested
    3. Template(from data)?✅
    3. Code body ✅
    4. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#

#|PROBLEM A:
Finish the uncompleted steps ❌ of Data Design above for Battery and EVCar
|#

(define-struct battery [id charge])
; Battery is (make-battery Number Number)
; interp.
; id is a unique part number the car will check if it is compatible
; charge is the percentage charge of the battery

; battery-id : (Battery -> Number)
; battery-charge : (Battery -> Number)

(define battery-tesla-full (make-battery 1 100))
(define battery-tesla-half (make-battery 1 50))

(define battery-byd-half (make-battery 2 50))
(define battery-byd-full (make-battery 2 100))

(define (battery-temp bt)
  (... (battery-id bt)
       (battery-charge bt)))

(define-struct evcar [name batt])
; EVCar is (make-evcar String Battery)
; interp.
; name is the brand name of the car
; batt is a reference to Battery

; evcar-name : (EVCar -> Name)
; evcar-batt : (EVCar -> Battery)

(define tesla (make-evcar "Tesla" battery-tesla-half))
(define byd (make-evcar "BYD" battery-byd-full))

(define (evcar-temp ev)
  (... (evcar-name ev) 
       (battery-temp (evcar-batt ev))))

#|PROBLEM B:
In some parts of China, there are EV battery swapping stations! The battery swap should only happen if the id number in the car and the new battery matches AND if the new battery has more charge than the one being replaced

Write a function "update-battery" that consumes an EvCar and a Battery and produces the car with the potentially replaced battery
|#

(check-expect (update-battery tesla battery-tesla-full)
              (make-evcar "Tesla" battery-tesla-full))

(check-expect (update-battery byd battery-byd-half)
              (make-evcar "BYD" battery-byd-full))

(check-expect (update-battery byd battery-tesla-full)
              (make-evcar "BYD" battery-byd-full))

; update-battery : (EVCar Battery -> EVCar)
; replaces the battery of the ev car
(define (update-battery ev nbatt)
  (make-evcar (evcar-name ev) 
              (decide-battery (evcar-batt ev) nbatt)))

; decide-battery : (Battery Battery -> Battery)
; produces the the 2nd given battery if it has more charge than the 1st and is of the same id
(define (decide-battery bt bt2)
  (if (and (= (battery-id bt) (battery-id bt2))
           (< (battery-charge bt) (battery-charge bt2)))
      bt2
      bt))