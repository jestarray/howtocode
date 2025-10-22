#lang htdp/isl+
(require 2htdp/image)
(define PNAME 'keep-if)
#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete
== Data ==
    1. Data Description✅
        1B. if using define-struct, write all accessor signatures✅
    2. Interpretation✅
    3. Data Examples✅
    4. A function template that processes this data✅
== Functions ==
    1. Signature, purpose, stub ✅
    2. Examples (aka check-expect/tests, elaborate the concrete) ✅
      2B. if the function consumes a list, make sure a list of 2 or longer is tested ✅
    3. Template(from data)?✅
    4. Code body ✅
    5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#

#| PROBLEM A:
Design a function "positives-only" that consumes a ListOfNumbers and
produces only all the positive numbers.
Note that zero is not a positive number
|#

(: positives-only ([ListOf Number] -> [ListOf Number]))
; keep only those numbers biggers than the given "limit"
(check-expect (positives-only empty) empty)
(check-expect (positives-only (list -1 0 -4 9)) (list 9))
(define (positives-only lst)
  (cond
    [(empty? lst) empty]
    [else
     (if (positive? (first lst))
         (cons (first lst) (positives-only (rest lst)))
         (positives-only (rest lst)))]))

#| PROBLEM B:
Design a function "negatives-only" that consumes a ListOfNumbers and
produces only all the negative numbers.
Note that zero is not a negative number
|#
(: negatives-only ([ListOf Number] -> [ListOf Number]))
; keep only those numbers biggers than the given "limit"
(check-expect (negatives-only empty) empty)
(check-expect (negatives-only (list -1 0 -4 9)) (list -1 -4))
(define (negatives-only lst)
  (cond
    [(empty? lst) empty]
    [else
     (if (negative? (first lst))
         (cons (first lst) (negatives-only (rest lst)))
         (negatives-only (rest lst)))]))

#|PROBLEM C:
Abstract "positives-only" and "negatives-only" into a "keep-if" function
that will consume a function and then a list
|#
(: keep-if ((Number -> Boolean) [ListOf Number] -> [ListOf Number]))
; keep only those numbers biggers than the given "limit"
(check-expect (keep-if positive? (list -1 0 -4 9)) (list 9))
(check-expect (keep-if negative? (list -1 0 -4 9)) (list -1 -4))
(define (keep-if fn lst)
  (cond
    [(empty? lst) empty]
    [else
     (if (fn (first lst))
         (cons (first lst) (keep-if fn (rest lst)))
         (keep-if fn (rest lst)))]))

#|PROBLEM D:
Use the abstracted function "keep-if" in PROBLEM C to reimplement "positives-only?" and "negatives-only?"
|#
(define (positives-only?v2 lst) (keep-if positive? lst))
(define (negatives-only?v2 lst) (keep-if negative? lst))

#|PROBLEM E: OPTIONAL
For more practice copy and paste "keep-if" function from PROBLEM C and
try to reimplement 15.00 problems with keep-if
|#