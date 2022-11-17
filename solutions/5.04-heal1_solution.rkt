;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 5.04-heal1_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'heal1)
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
Consider a video game where you need to represent the health of your
character. The only thing that matters about their health is:

- if they are dead (which is shockingly poor health)
- if they are alive then they can have 0 or more extra lives

Design a data definition called Health to represent the health of your
character.
|#

; Health is one of:
; #false
; Natural Number
; interp. Natural number means how many lives left, #false means dead
(define DEAD #false)
(define L1 1)

(define (health-temp hp)
    (cond
        [(boolean? hp) ...]
        [(number? hp) (... hp)]))

#|PROBLEM B:
Design a function called "heal1" that allows you to increase the
lives of a character. The function should only increase the lives
of the character if the character is not dead, otherwise the character
remains dead.
|#

; heal1 : (Health -> Health)
; bumps a players health by 1 if still alive, otherwise remain dead
(check-expect (heal1 #false) #false)
(check-expect (heal1 0) 1)

(define (heal1 hp)
    (cond
        [(boolean? hp) #false]
        [(number? hp) (add1 hp)]))