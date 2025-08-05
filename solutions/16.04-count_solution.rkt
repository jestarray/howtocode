;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 16.04-count_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'count)
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

; ListOfAny is one of:
; - empty
; - (cons Any ListOfAny)
; interp. a list of anything

; list-any-temp : (ListOfAny -> ???)
(define (list-any-temp any-lst)
  (cond
    [(empty? any-lst) ...]
    [else
     (... (first any-lst)
          (list-any-temp (rest any-lst)))]))

#|PROBLEM A:
Design the function "count" that consumes a list lst and a value val.
The function computes the number of times that val appears in lst.
For example:
(count (cons 9 (cons 9 (cons 7 empty))) 9) -> 2 (two 9's in the list)
(count (cons 9 (cons 9 (cons 7 empty))) 7) -> 1
|#

; count : (ListOfAny Any -> Number)
; produces the amount of times the given val appears in the list
(check-expect (count empty 2) 0)
(check-expect (count (cons 4 empty) 4) 1)
(check-expect (count (cons 9 (cons 9 (cons 7 empty))) 9) 2)
(check-expect (count (cons 9 (cons 9 (cons 7 empty))) 7) 1)
;(define (count any-lst val) 0)

(define (count any-lst val)
  (cond
    [(empty? any-lst) 0]
    [else
     (if (equal? val (first any-lst))
         (+ 1 (count (rest any-lst) val))
         (count (rest any-lst) val))]))