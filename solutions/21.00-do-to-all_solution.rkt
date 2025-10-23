#lang htdp/isl+
(require 2htdp/image)
(define PNAME 'do-to-all)
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
Design a function "square-all" that consumes a ListOfNumbers and squares the numbers
For example (square-all (list 1 2 3)) -> (list 1 4 9)
|#

(: square-all ([ListOf Number] -> [ListOf Number]))
; keep only those numbers biggers than the given "limit"
(check-expect (square-all empty) empty)
(check-expect (square-all (list 1 2 3)) (list 1 4 9))
(define (square-all lst)
  (cond
    [(empty? lst) empty]
    [else
     (cons
      (sqr (first lst))
      (square-all (rest lst)))]))

#| PROBLEM B:
Design a function "sqrt-all" that consumes a ListOfNumbers and sqrt the numbers
For example (sqrt-all (list 1 4 9)) -> (list 1 2 3)
|#
(: sqrt-all ([ListOf Number] -> [ListOf Number]))
; keep only those numbers biggers than the given "limit"
(check-expect (sqrt-all empty) empty)
(check-expect (sqrt-all (list 1 4 9)) (list 1 2 3))
(define (sqrt-all lst)
  (cond
    [(empty? lst) empty]
    [else
     (cons
      (sqrt (first lst))
      (sqrt-all (rest lst)))]))

#|PROBLEM C:
Abstract "square-all" and "sqrt-all" into a "do-to-all" function
that will consume a function and then a list
|#
; (: do-to-all ((Number -> Number) [ListOf Number] -> [ListOf Number]))
; keep only those numbers biggers than the given "limit"
(check-expect (do-to-all sqr (list 1 2 3)) (list 1 4 9))
(check-expect (do-to-all sqrt (list 1 4 9)) (list 1 2 3))
(define (do-to-all fn lst)
  (cond
    [(empty? lst) empty]
    [else
     (cons
      (fn (first lst))
      (do-to-all fn (rest lst)))]))

#|PROBLEM D:
Use the abstracted function "do-to-all" in PROBLEM C to reimplement "square-all" and "sqrt-all"
|#
(define (square-all-v2 lst) (do-to-all sqr lst))
(define (sqrt-all-v2 lst) (do-to-all sqrt lst))

#|PROBLEM E:
Design a function "bar-numbers" that consumes a ListOfNumbers and turns each number
into (rectangle 16 N "solid" "blue") long, where N is the number in the list
|#
(: bar-numbers ([ListOf Number] -> [ListOf Any]))
(check-expect (bar-numbers (list 10 20))
              (list (rectangle 16 10 "solid" "green")
                    (rectangle 16 20 "solid" "green")))
(define (bar-numbers lst)
  (do-to-all number->rect lst))

(: number->rect (Number -> Any))
(check-expect (number->rect 5) (rectangle 16 5 "solid" "green"))
(define (number->rect n) (rectangle 16 n "solid" "green"))

#|PROBLEM F: OPTIONAL
For more practice copy and paste "do-to-all" function defined here and
reimplement all 14.00 problems with "do-to-all"
|#