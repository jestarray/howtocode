#lang htdp/isl+
(define PNAME 'zip)
#| Data definitions:
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete

1. Data Description✅
   1B. if using define-struct, write all accessor signatures✅
2. Interpretation✅
3. Data Examples✅
4. A function template that processes this data✅

Functions:
1. Signature, purpose, stub ✅
2. Examples (aka check-expect/tests, elaborate the concrete) ✅
  2B. if the function consumes a list, make sure a list of 2 or longer is tested✅
3. Template(from data)?✅
4. Code body ✅
5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#

; ############################################################################

#|PROBLEM A:
Given the data definition below,
design a function called zip that consumes two
lists of numbers and produces a list of Entry, formed from the corresponding
elements of the two lists.

(zip (list 1 2 ...) (list 11 12 ...)) should produce:

(list (make-entry 1 11) (make-entry 2 12) ...)

Your design should assume that the two lists have the same
|#

(define-struct entry [k v])
; Entry is (make-entry Number Number)
; Interp. an entry maps a key to a value
(define e1 (make-entry 3 12))

; ListOfEntry is one of:
;  - empty
;  - (cons Entry ListOfEntry)
; interp. a list of key value entries
(define e-lst (list e1 (make-entry 2 11)))

(: zip ([ListOf Number] [ListOf Number] -> [ListOf Entry]))
; produces a list of entries where each entry corresponds
; with the n-th element of each list
(check-expect (zip empty empty) empty)
(check-expect (zip (list 2 4 9)
                   (list 7 3 0))
              (list (make-entry 2 7)
                    (make-entry 4 3)
                    (make-entry 9 0)))
(define (zip l1 l2)
  (cond
    [(empty? l1) empty]
    [else
     (cons (make-entry (first l1) (first l2))
           (zip (rest l1) (rest l2)))]))

; abstract function version
#;
(define (zip l1 l2)
  (map
   (lambda (item1 item2)
     (make-entry item1 item2)) l1 l2))