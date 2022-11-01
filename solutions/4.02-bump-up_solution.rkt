;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname image-larger_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'bump-up)
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

; NumberGrade is a Natural Number [0, 100]
; interp. the number grade of an assignment
(define ng1 100)
(define ng2 50)

(define (numgrade-temp num)
  (... num))

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

#| Problem 4.02:
Use the data definition you wrote above and design a "bump-up" function 
that consumes a LetterGrade and produces a LetterGrade 1 rank above.
|#

; bump-up : (LetterGrade -> LetterGrade)
; produces a letter grade 1 rank above
(check-expect (bump-up A) A)
(check-expect (bump-up B) A)
(check-expect (bump-up C) B)
(check-expect (bump-up D) C)
(check-expect (bump-up F) D)

(define (bump-up lg)
  (cond
    [(string=? lg A) A]
    [(string=? lg B) A]
    [(string=? lg C) B]
    [(string=? lg D) C]
    [(string=? lg F) D]))