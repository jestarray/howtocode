#lang htdp/isl+
(define PNAME 'qsort)
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

Generative Recursion Questions:
1. Include "how" the function will compute the result in the purpose statement,
instead of just the "what" in your own words.
2. Trivial Case: What is the simplest version of this problem?
3. Solution: How do I solve the trivial case?
4. Generation: How do I generate new, smaller sub-problems?
5. Combination: How do I combine those results to solve the original task?
6. Validity: Write a disclaimer on invalid inputs of the function
7. Termination: investigate whether the problem data for each recursive data
is smaller than the given data; find examples that cause the function to loop
|#

; ############################################################################

#|PROBLEM A:
Design "isort"(aka insertion sort) which consumes a ListOfNumber and
produces a ListOfNumber with the number sorted from smallest to largest.
For example:
(isort (list 8 4 9 1))
produces:
(list 1 4 8 9)

The function sorts the numbers in the list by checking every number and
comparing it against every other number in the list
and inserting it in the right place.

This requires a helper function "insert" which consumes a ListOfNumber and a Number
and assumes the list is already sorted(even though it sometimes isn't).
It does so by inserting the given number in front of the first number it encounters
that is greater than it
This is a structural recursion problem!
The function inserts the Number in what is assumed to be an already sorted list

Here's a genernal visualization of how it works:
https://upload.wikimedia.org/wikipedia/commons/9/9c/Insertion-sort-example.gif
|#
(check-expect (isort empty) empty)
(check-expect (isort (list 7))
              (list 7))
(check-expect (isort (list 8 4 9 1))
              (list 1 4 8 9))
(: isort ([ListOf Number] -> [ListOf Number]))
; produces a sorted version of l
(define (isort lst)
  (cond
    [(empty? lst) empty]
    [else
     (insert (first lst) (isort (rest lst)))]))

(: insert ([ListOf Number] -> [ListOf Number]))
; inserts the given number in the correct position of the given list
; it does so by inserting the given number in front of the first number
; it encounters that is greater than it
; we assume that the given list is already sorted
(check-expect (insert empty 94)
              (list 94))
(check-expect (insert (list 4) 9)
              (list 4 9))
(check-expect (insert (list 4) 0)
              (list 0 4))
(check-expect (insert (list 8 5) 6)
              (list 8 5 6))
(check-expect (insert (list 8 5) 1)
              (list 1 8 5))
(define (insert num lst)
  (cond
    [(empty? lst) (cons num empty)]
    [else
     (if (<= num (first lst))
         (cons num lst) ; put it in front!
         (cons (first lst) (insert num (rest lst))))]))

#|PROBLEM B:
Design "qsort", which implements the quick-sort algorithim as described:

To qsort a list, we will first make the problem
smaller by breaking it into two lists, sort them, and then
put them back together. 

               (list 6 8 1 9 3 7 2)

               /         |        \
              /          |         \
    (list 1 3 2)         6        (list 8 9 7)

     /  |  \                         /    |    \
    /   |   \                       /     |     \
 empty  1 (list 3 2)          (list 7)    8    (list 9)

            /  |  \             / | \           /  |  \
           /   |   \           /  |  \         /   |   \
      (list 2) 3  empty     empty 7 empty    empty 9  empty

        / | \
       /  |  \
      /   |   \
    empty 2  empty


Steps in qsort:

1) define the first item in the list as the "pivot"
2) Create two lists:
    - "lower" -  all values are lower than pivot
    - "higher" - all values are higher than the pivot
3) apply the qsort algorithm (steps 1 and 2) to the two created lists
   until the lists we create are empty
4) append the sorted "lower" list, with a list containing the pivot
   with the sorted "higher" list

For example in the diagram above:
6 is the pivot, so we gather up all the numbers less than 6,
and then all the ones greater than 6, and recursively apply those until they are just
numbers and empty lists. Then combine them together with append.

This way of sorting is called "quicksort". It is a generative
recursion.

You are NOT allowed to use builtin sort functions, e.g quicksort, sort,
or insertion sort.
Section in the book:
https://htdp.org/2025-12-27/Book/part_five.html#(part._sec~3aquick-sort)
|#

(: qsort ([ListOf Number] -> [ListOf Number]))
; produces a sorted version of lst using the quicksort algorithm described above
(check-expect (qsort empty) empty)
(check-expect (qsort (list 7))
              (list 7))
(check-expect (qsort (list 7 5))
              (list 5 7))
(check-expect (qsort (list 8 4 9 1))
              (list 1 4 8 9))
;(define (qsort lst) empty)
(define (qsort lst)
  (cond
    [(empty? lst) empty]
    [else
     (local
       [
        (define pivot (first lst)) ; Number
        (define lower (smaller lst pivot))
        (define higher (larger lst pivot))
        ]
       (append
        (qsort lower)
        (list pivot)
        (qsort higher)))]))


(: smaller ([ListOf Number] Number -> [ListOf Number]))
; produces all the numbers smaller than the given number(the pivot)
(check-expect (smaller empty 5) empty)
(check-expect (smaller (list 1 2 3 4 5 6 7 8 9) 5)
              (list 1 2 3 4))
(check-expect (smaller (list 9 5 2 4 0 8 2 4 1) 5)
              (list 2 4 0 2 4 1))
;(define (smaller lst num) empty)
(define (smaller lst num)
  (cond
    [(empty? lst) empty]
    [else
     (if (< (first lst) num)
         (cons (first lst) (smaller (rest lst) num))
         (smaller (rest lst) num))]))


(: larger ([ListOf Number] Number -> [ListOf Number]))
; produces all the numbers larger than the given number(the pivot)
(check-expect (larger empty 5) empty)
(check-expect (larger (list 1 2 3 4 5 6 7 8 9) 5)
              (list 6 7 8 9))
(check-expect (larger (list 9 5 2 4 0 8 2 4 1) 5)
              (list 9 8))
(define (larger lst num)
  (cond
    [(empty? lst) empty]
    [else
     (if (> (first lst) num)
         (cons (first lst) (larger (rest lst) num))
         (larger (rest lst) num))]))