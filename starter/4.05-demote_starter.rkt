;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname image-larger_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'demote)
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
    1. Signature, purpose, stub ❌
    2. Examples (aka check-expect, elaborate the concrete) ❌
    3. Template(from data)?❌
    3. Code body ❌
    4. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
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
Using the data definition from the previous problem "Rank"
Design a function "demote" that consumes a rank and
produces the rank below it. For example:
"Diamond" can be demoted to "Platinum"
|#