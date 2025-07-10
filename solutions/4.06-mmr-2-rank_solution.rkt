;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4.06-mmr->rank_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'mmr->rank)
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
    4. Code body ✅
    5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
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

#| PROBLEM A:
Alongside the metal named rankings, games also use "MMR"(match making rating)
to more accurately describe the range of a players skill. 
MMR is usually a number between 0 to infinity with a set of the following intervals:
Between 0 and 1149
Between 1150 and 1499
Between 1500 and 1849
Between 1850 and 2199
2200 and above
where each interval above maps to Bronze, Silver, Gold, Platinum, Diamond respectively

Write a data definition for "MMR" following the design recipe for data.
HINT: https://howtocode.pages.dev/htdp_templates#interval_cheatsheet
|#

; MMR is a Natural number that falls into one of:
; [0, 1149]
; [1150, 1499]
; [1500, 1849]
; [1850, 2199]
; [2200, infinity]
; interp. a numerial ranking for player skill where
; [0, 1149] means Bronze
; [1150, 1499] means Silver
; [1500, 1849] means Gold
; [1850, 2199] means Platinum
; [2200, infinity] means Diamond

(define MMR 1000)

(define (mmr-temp m)
  (cond 
    [(and (>= m 0) (<= m 1149)) ...]
    [(and (>= m 1150) (<= m 1499)) ...]
    [(and (>= m 1500) (<= m 1849)) ...]
    [(and (>= m 1850) (<= m 2199)) ...]
    [(>= m 2200) ...]))

#| PROBLEM B:
Design the function "mmr->rank" that consumes an MMR and produces the equivalent Rank
based on the following criteria:
    Bronze: Between 0 and 1149
    Silver: Between 1150 and 1499
    Gold: Between 1500 and 1849
    Platinum: Between 1850 and 2199
    Diamond: 2200 and above
note: this is also described in the interpretation of MMR
|#

; mmr->rank : (MMR -> Rank)
; produces the equivalent rank based on the criteria above

(check-expect (mmr->rank 0) BRONZE)
(check-expect (mmr->rank 500) BRONZE)
(check-expect (mmr->rank 1149) BRONZE)

(check-expect (mmr->rank 1150) SILVER)
(check-expect (mmr->rank 1200) SILVER)
(check-expect (mmr->rank 1499) SILVER)

(check-expect (mmr->rank 1500) GOLD)
(check-expect (mmr->rank 1600) GOLD)
(check-expect (mmr->rank 1849) GOLD)

(check-expect (mmr->rank 1850) PLATINUM)
(check-expect (mmr->rank 2000) PLATINUM)
(check-expect (mmr->rank 2199) PLATINUM)

(check-expect (mmr->rank 2200) DIAMOND)
(check-expect (mmr->rank 3000) DIAMOND)

(define (mmr->rank m)
  (cond 
    [(and (>= m 0) (<= m 1149)) BRONZE]
    [(and (>= m 1150) (<= m 1499)) SILVER]
    [(and (>= m 1500) (<= m 1849)) GOLD]
    [(and (>= m 1850) (<= m 2199)) PLATINUM]
    [(>= m 2200) DIAMOND]))