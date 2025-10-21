#lang htdp/isl+
(define PNAME 'abstract-add)
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
    1. Signature, purpose, stub ❌
    2. Examples (aka check-expect/tests, elaborate the concrete) ❌
      2B. if the function consumes a list, make sure a list of 2 or longer is tested ❌
    3. Template(from data)?❌
    4. Code body ❌
    5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
|#

(: add1* ([ListOf Number] -> [ListOf Number]))
; adds 1 to each item on lst
(check-expect (add1* (list 1 3 5)) (list 2 4 6))
(define (add1* lst)
  (cond
    [(empty? lst) empty]
    [else
     (cons
      (add1 (first lst))
      (add1* (rest lst)))]))

(: plus5 ([ListOf Number] -> [ListOf Number]))
(check-expect (plus5 (list 1 3 5)) (list 6 8 10))
; adds 5 to each item on lst
(define (plus5 lst)
  (cond
    [(empty? lst) empty]
    [else
     (cons
      (+ (first lst) 5)
      (plus5 (rest lst)))]))

; PROBLEM A: ABSTRACT add1* & plus5 into a new general abstract function
; TODO

; PROBLEM B: Reimplement the add1* & plus5 with the abstract function from PROBLEM A
; TODO