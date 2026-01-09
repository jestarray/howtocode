;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 14.00-double-all_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'double-all)
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

; ############################################################################

; ListOfNumber is one of:
; - empty
; - (cons Number ListOfNumber)
; interp. a list of numbers
(define nums1 (cons 2 (cons 5 empty)))

; list-nums-temp : (ListOfNumber -> ???)
(define (list-nums-temp num-lst)
  (cond
    [(empty? num-lst) ...]
    [else
     (... (first num-lst)
          (list-nums-temp (rest num-lst)))]))

#|PROBLEM A:
Notice how the data design step are done. 
Write a function 'double-all' that consumes a list of numbers
and doubles every number in that list.
For example:
(double-all (cons 2 (cons 5 empty)))
produces:
(cons 4 (cons 10 empty))
Finish the uncompleted function design steps ❌ 1-5 above
|#

; double-all: (ListOfNumber -> ListOfNumber)
; produces the given list of numbers with every number doubled
(check-expect (double-all empty) empty)
(check-expect (double-all (cons 2 empty))
              (cons (* 2 2) empty))
(check-expect (double-all (cons 2 (cons 5 empty)))
              (cons (* 2 2) (cons (* 2 5) empty)))
; (define (double-all ls) empty)

(define (double-all nums)
  (cond
    [(empty? nums) empty]
    [else
     (cons (* (first nums) 2)
           (double-all (rest nums)))]))