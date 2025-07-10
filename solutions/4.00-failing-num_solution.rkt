;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname image-larger_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'failing-num?)
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

#| PROBLEM 4.00A:
A number grade often written in red to indicate performance on
an assignment is a number between [0 to 100] inclusive.
Follow the design recipe for data and write the data definitions for "NumberGrade"
|#

; NumberGrade is a Natural Number [0, 100]
; interp. the number grade of an assignment
(define ng1 100)
(define ng2 50)

(define (numgrade-temp num)
  (... num))

#| PROBLEM 4.00B:
Use the data definition you wrote above and design a "failing-num?" function that
consumes a NumberGrade and produces whether or not the given NumberGrade is failing.
Assume that 40 or below is failing
|#

; failing-num? : (NumberGrade -> Boolean)
; producess #true if the given grade is 40 or lower
(check-expect (failing-num? 90) #false)
(check-expect (failing-num? 41) #false)
(check-expect (failing-num? 40) #true)
(check-expect (failing-num? 39) #true)

(define (failing-num? n)
  (<= n 40))

#| PROBLEM 4.00C:
Grades in the USA sometimes use letters: A, B, C, D, F
Follow the design recipe for data and write the data definitions for "LetterGrade"
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