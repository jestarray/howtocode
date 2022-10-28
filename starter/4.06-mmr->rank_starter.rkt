;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4.06-mmr->rank_starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'mmr->rank)
#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete
== Data ==
    1. Data Description❌
    2. Interpretation❌
    3. Data Examples❌
    4. A function template that processes this data❌
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

#| Problem A:
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

#| Problem B:
Design the function "mmr->rank" that consumes an MMR and produces the equivalent Rank
based on the following criteria:
    Bronze: Between 0 and 1149
    Silver: Between 1150 and 1499
    Gold: Between 1500 and 1849
    Platinum: Between 1850 and 2199
    Diamond: 2200 and above
note: this is also described in the interpretation of MMR
|#