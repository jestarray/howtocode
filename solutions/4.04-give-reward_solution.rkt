;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4.04-give-reward_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'give-reward?)
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

#| Problem:
Rankings in various games like Chess, League of Legends, Rocket League, use 
metal names to showcase rankings. 
A rank can be either(ordered from worst to best):
Bronze, Silver, Gold, Platinum, or Diamond

Write the data definition for "Rank" following the design recipe for data.
|#

; Rank is one of:
; - "Bronze"
; - "Silver"
; - "Gold"
; - "Platinum"
; - "Diamond"
; interp. the name of ranks in a game where
; "Bronze" is the worst and "Diamond" is the best

(define BRONZE "Bronze")
(define SILVER "Silver")
(define GOLD "Gold")
(define PLATINUM "Platinum")
(define DIAMOND "Diamond")

(define (rank-temp r)
  (cond
    [(string=? r BRONZE) ...]
    [(string=? r SILVER) ..]
    [(string=? r GOLD) ...]
    [(string=? r PLATINUM) ...]
    [(string=? r DIAMOND) ...]))

#| Problem:
Use the data definition you wrote above and design a "give-reward?" function 
that determines whether or not a rank is eligible for an award.
Rewards are only given to those gold or higher
|#

; give-reward?: (Rank -> Boolean)
; produces #true if gold or higher

(check-expect (give-reward? BRONZE) #false)
(check-expect (give-reward? SILVER) #false)
(check-expect (give-reward? GOLD) #true)
(check-expect (give-reward? PLATINUM) #true)
(check-expect (give-reward? DIAMOND) #true)

(define (give-reward? r)
  (cond
    [(string=? r BRONZE) #false]
    [(string=? r SILVER) #false]
    [(string=? r GOLD) #true]
    [(string=? r PLATINUM) #true]
    [(string=? r DIAMOND) #true]))