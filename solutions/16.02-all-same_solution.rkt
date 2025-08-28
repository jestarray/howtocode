;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 9.06-all-same_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'all-same)
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

; ListOfNumber is one of:
; - empty
; - (cons Number ListOfNumber)
; interp. a list of Numbers
(define nums1 (cons 8 empty))
(define nums2 (cons 2 (cons 5 empty)))
(define nums3 (cons 2 (cons 2 (cons 2 (cons 2 empty)))))
(define nums4 (cons 2 (cons 2 (cons 3 (cons 2 empty)))))

; list-nums-temp : (ListOfNumber -> ???)
(define (list-nums-temp num-lst)
  (cond
    [(empty? num-lst) ...]
    [else
     (... (first num-lst)
          (list-nums-temp (rest num-lst)))]))

#|PROBLEM A:
Notice how the data design step is done.
Write a function 'all-same?' that consumes a ListOfNumber
and produces #true if all the numbers in the list are the same:
For example:
(all-same? (cons 3 empty)) -> #true
(all-same? (cons 1 (cons 1 empty))) -> #true
(all-same? (cons 0 (cons 1 empty))) -> #false
HINT: Use 'second'
|#

; all-same? : (ListOfNumber -> Boolean)
; produces #true if all the numbers in the list are the same
(check-expect (all-same? nums0) #true)
(check-expect (all-same? nums1) #true)
(check-expect (all-same? nums2) #false)
(check-expect (all-same? nums3) #true)
(check-expect (all-same? nums4) #false)

; (define (all-same? nums) 0)

(define (all-same? nums)
  (cond
    [(empty? nums) #true]
    [(= 1 (length nums)) #true]
    [else
     (and (= (first nums) (second nums))
          (all-same? (rest nums)))]))