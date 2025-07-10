;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 9.00-in-city-state_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'in-city-state)

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
    3. Template(from data)?✅
    3. Code body ✅
    4. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#

#|PROBLEM A:
Finish the uncompleted steps ❌ of Data Design above for both Address and Person
|#

(define-struct address [city state])
; Address is (make-address String String)
; interp.
; an american style address. Fields are self explanatory
(define LA (make-address "Los Angeles" "CA"))
(define SF (make-address "San Francisco" "CA"))
(define NYC (make-address "New York City" "NY"))

; address-city : (Address -> String)
; address-state: (Address -> String)
(define (address-temp ad)
  (... (address-city ad) 
       (address-state ad)))

(define-struct person [fname lname address])
; Person is (make-person String String Address)
; interp.
; fname means firstname
; lname means lastname
; address is an american style address

; person-fname : (Person -> String)
; person-lname : (Person -> String)
; person-address: (Person -> Adress)

(define bob (make-person "joe" "smith" LA))
;(define jill (make-person "jill" "lee" NYC))

(define (person-temp ps)
  (... (person-fname ps)
       (person-lname ps)
       (address-temp (person-address ps)))) ;reference

#|PROBLEM B:
Design the function "in-city-state?" that consumes a Person and an Address, and produces whether or not the given person is at the given address.
|#

; in-city-state? : (Person Address -> Boolean)
; produce #true if the given person is at the given address
(check-expect (in-city-state? bob LA) #true)
(check-expect (in-city-state? bob SF) #false)
(check-expect (in-city-state? bob NYC) #false)
; (define (in-city-state? pr ad) #false)

(define (in-city-state? ps ad)
  (address=? ad (person-address ps))) ;reference

; inline version:
(define (in-city-state-inline? ps ad)
  (and (string=? (address-city ad) (address-city (person-address ps)))
       (string=? (address-state ad) (address-state (person-address ps))))) ;reference

; address=? : (Adress Address -> Boolean)
; produces #true if the two given addresses are the same
(check-expect (address=? LA SF) #false)
(check-expect (address=? LA NYC) #false)
(check-expect (address=? LA LA) #true)
;(define (address=? ad ad1) false)
(define (address=? ad ad1)
  (and (string=? (address-city ad) (address-city ad1))
       (string=? (address-state ad) (address-state ad1))))