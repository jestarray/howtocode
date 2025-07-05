;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 9.04-charge-message_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'charge-message)

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
Finish the uncompleted steps ❌ of Data Design above for both Ink and Printer
|#

(define-struct battery [percent charge-rate])
; Battery is (make-battery Number Number)
; interp.
; percentage is the amount of charge
; charge-rate is the percentage of charge PER MINUTE

; battery-percent : (Battery -> Number)
; battery-charge-rate : (Battery -> Number)

(define full (make-battery 100 5))
(define half (make-battery 50 5))
(define twenty-10 (make-battery 20 10))

(define (battery-temp bat)
  (... (battery-percent bat) ... (battery-charge-rate bat)))

(define-struct phone [name battery])
; Phone is (make-phone String Battery)
; interp.
; name is the brand name and model
; battery is a reference to Battery

; phone-brand : (Phone -> String)
; phone-battey : (Phone -> Battery)

(define i10 (make-phone "iphone 10" full))
(define samsung (make-phone "Samsung Galaxy 24" half))
(define vivo (make-phone "Vivo" twenty-10))

(define (phone-temp ph)
  (... (phone-brand ph) ... (battery-temp (phone-battery ph))))

#|PROBLEM B:
https://howtocode.pages.dev/images/charge_info.png
(don't worry about spacing percentange and minutes left into new lines)

Phones(mainly Android) have a feature where it will tell you how long it will take to charge:
"<current-percentage>% 19 m until full"
We are only concerned with minutes, no need to convert them to hours(challenge yourself ;))
In the case of fully charged:
"Fully charged"

Design a function "charge-mesasage" that consumes a Phone and provides the given purpose above.
|#

; charge-message : (Phone -> String)
; produce the minutes left until full or "Fully charged"
(check-expect (charge-message i10) "Fully charged")
(check-expect (charge-message samsung) "50% 10 m until full")
(check-expect (charge-message vivo) "20% 8 m until full")
; (define (charge-message ph) "")

(define (charge-message ph)
  (battery-message (phone-battery ph)))

; battery-message: (Battery -> String)
; same purpose as charge-message
(define (battery-message bat)
  (cond
    [(>= (battery-percent bat) 100)
     "Fully charged"]
    [else
     (string-append
      (number->string (battery-percent bat)) "% " 
      (number->string
       (/ (- 100 (battery-percent bat)) (battery-charge-rate bat)))
      " m until full")]))