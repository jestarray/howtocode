#lang htdp/isl+
(define PNAME 'abstract-extract)
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

; PROBLEM A: Write tests for "smaller-than" and "larger-than"
(: smaller-than ([ListOf Number] Number -> [ListOf Number]))
; keep only those numbers smaller than the given "limit"
; TODO TESTS
(define (smaller-than lst limit)
  (cond
    [(empty? lst) empty]
    [else
     (if (< (first lst) limit)
         (cons (first lst) (smaller-than (rest lst) limit))
         (smaller-than (rest lst) limit))]))

(: larger-than ([ListOf Number] Number -> [ListOf Number]))
; keep only those numbers biggers than the given "limit"
; TODO TESTS
(define (larger-than lst limit)
  (cond
    [(empty? lst) empty]
    [else
     (if (> (first lst) limit)
         (cons (first lst) (larger-than (rest lst) limit))
         (larger-than (rest lst) limit))]))

; PROBLEM B: Abstract "smaller-than" & "larger-than" with a NEW function, call it "extract"
; TODO

; PROBLEM C: Use the abstracted function from PROBLEM B to re-implement "smaller-than" & "larger-than"
; TODO