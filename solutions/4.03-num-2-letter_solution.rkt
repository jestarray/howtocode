;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname image-larger_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'num->letter)
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

; LetterGrade is one of:
; - "A"
; - "B"
; - "C"
; - "D"
; - "F"

(define A "A")
(define B "B")
(define C "C")
(define D "D")
(define F "F")

(define (letter-grade-temp lg)
  (cond
    [(string=? lg A) ...]
    [(string=? lg B) ...]
    [(string=? lg C) ...]
    [(string=? lg D) ...]
    [(string=? lg F) ...]))

#| PROBLEM A:
Notice how the "NumberGrade" data definition below has been revised to describe
in more detail, sets on intervals. Write a template for "NumberGrade".
HINT: https://howtocode.pages.dev/htdp_templates#interval_cheatsheet
|#

; NumberGrade is a Natural number that falls into one of:
;- (80, 100]
;- (60, 80]
;- (40, 60]
;- (20, 40]
;- [0, 20]
; interp.
;- (80, 100] means A
;- (60, 80] means B
;- (40, 60] means C
;- (20, 40] means D
;- [0, 20] means F

(define ng1 80)

(define (numgrade-temp num)
  (cond
    [(and (> num 80) (<= num 100)) ...]
    [(and (> num 60) (<= num 80)) ...]
    [(and (> num 40) (<= num 60)) ...]
    [(and (> num 20) (<= num 40)) ...]
    [(and (>= num 0) (<= num 20)) ...]))

#| PROBLEM B:
Design a "num->letter" function that consumes a NumberGrade 
and produces a LetterGrade based on the following intervals
described by the interpretation.
|#

; num->letter : (NumberGrade -> LetterGrade)
; produces a letter grade based off the intervals provided
(check-expect (num->letter 100) A)
(check-expect (num->letter 85)  A)
(check-expect (num->letter 80)  B)
(check-expect (num->letter 75)  B)
(check-expect (num->letter 60)  C)
(check-expect (num->letter 55)  C)
(check-expect (num->letter 40)  D)
(check-expect (num->letter 35)  D)
(check-expect (num->letter 20)  F)
(check-expect (num->letter 15)  F)

(define (num->letter num)
  (cond
    [(and (> num 80) (<= num 100)) A]
    [(and (> num 60) (<= num 80)) B]
    [(and (> num 40) (<= num 60)) C]
    [(and (> num 20) (<= num 40)) D]
    [(and (>= num 0) (<= num 20)) F]))