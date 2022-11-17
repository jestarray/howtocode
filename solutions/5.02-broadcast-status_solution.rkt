;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 5.02-broadcast-status_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'broadcast-status)
#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete
== Data ==
    1. Data Description✅
    2. Interpretation✅
    3. Data Examples✅
    4. A function template that processes this data✅
== Functions ==
    1. Signature, purpose, stub ✅
    2. Examples (aka check-expect, elaborate the concrete) ✅
    3. Template(from data)?✅
    3. Code body ✅
    4. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#

#|PROBLEM A:
You are designing a program to track a rocket's journey as it descends 
100 kilometers to Earth. You are only interested in the descent from 
100 kilometers to touchdown. Once the rocket has landed it is done.

Design a data definition to represent the rocket's remaining descent. 
Call it RocketDescent. Use a mixed data union to clearly
distinguish the case of when has shutdown and the journey is over. 
|#

; RocketDescent is one of:
; - Number
; - #false
; interp. false if rocket's descent has ended, otherwise number of kilometers
;         left to Earth, restricted to (0, 100]

(define RD1 100)
(define RD2 40)
(define RD3 0.5)
(define RD4 #false)

(define (rocket-descent-temp rd)
  (cond [(number? rd) (... rd)]
         [(boolean? rd) (...)])) 


#|PROBLEM B:
Design a function that will output the rocket's remaining descent distance 
in a short string that can be broadcast on Twitter. 
When the descent is over, the message should be "The rocket has landed!".
Otherwise produce a message that says "Altitude is <number> kms."
Call your function "broadcast-status"
|#

; broadcast-status : (RocketDescent -> String)
; produces a short announcement for twitter/media
(check-expect (broadcast-status 100) "Altitude is 100 kms.")
(check-expect (broadcast-status 1) "Altitude is 1 kms.")
(check-expect (broadcast-status #false) "The rocket has landed!")

(define (broadcast-status rd)
  (cond [(number? rd) (string-append "Altitude is " (number->string rd) " kms.")]
         [(boolean? rd) "The rocket has landed!"])) 