#lang htdp/isl+
(require 2htdp/image)
(define PNAME 'n-queens)
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

#|PROBLEM A:
Brute force "n-queens" solver.

Design a function "n-queens", which consumes a Number and produces
where it is valid to place a Queen without them threatening each other.

We will use a grid/board that starts from the top left like so:
+-------+-------+-------+
|       |       |       |
| (0,0) | (1,0) | (2,0) |
|       |       |       |
+-------+-------+-------+
|       |       |       |
| (0,1) | (1,1) | (2,1) |
|       |       |       |
+-------+-------+-------+
|       |       |       |
| (0,2) | (1,2) | (2,2) |
|       |       |       |
+-------+-------+-------+

A Queen moves like this in chess
(where Q in the center is the Queen);
┌───┬───┬───┬───┬───┬───┬───┬───┐
│ X │   │   │ X │   │   │ X │   │
├───┼───┼───┼───┼───┼───┼───┼───┤
│   │ X │   │ X │   │ X │   │   │
├───┼───┼───┼───┼───┼───┼───┼───┤
│   │   │ X │ X │ X │   │   │   │
├───┼───┼───┼───┼───┼───┼───┼───┤
│ X │ X │ X │ Q │ X │ X │ X │ X │
├───┼───┼───┼───┼───┼───┼───┼───┤
│   │   │ X │ X │ X │   │   │   │
├───┼───┼───┼───┼───┼───┼───┼───┤
│   │ X │   │ X │   │ X │   │   │
├───┼───┼───┼───┼───┼───┼───┼───┤
│ X │   │   │ X │   │   │ X │   │
├───┼───┼───┼───┼───┼───┼───┼───┤
│   │   │   │ X │   │   │   │ X │
└───┴───┴───┴───┴───┴───┴───┴───┘

The algorithm:
1. To generate every possible arrangement of placing a queen, 
2. filter the boards that are invalid
3. try to keep placing queens until you reach N queens
4. backtrack if you reach a dead end
5. The function will eventually reach playing N amount of queens
OR
produce #false because its insolvable.
For example, 2x2, 3x3, are UNSOLVABLE.
Some boards have multiple solutions, e.g 4x4, but
we just care about the 1st one it finds as a solution

The generation step creates an arbtrary arity(n-ary) tree
https://howtocode.pages.dev/images/nqueens.webp

The "render-queens" function is provided for you to help visualize
|#
(define TILE-SIZE 48)
(define SQUARE-GRID (square TILE-SIZE "outline" "black"))
(define QUEEN-IMG (text "♕" TILE-SIZE "red"))

(define-struct pos [x y])
; Pos is (make-pos Number Number)
; interp. represents where queen is placed in x & y assuming top left origin from 0,0
; in grid units
(define q-topleft (make-pos 0 0)) ; queen at the top left corner

; Board is a [ListOf Pos]
; interp. represents an EXISTING queen on a board
(define 1queen (list (make-pos 0 0)))
(define 4queens-solution#1 (list (make-pos 3 2) (make-pos 2 0) (make-pos 1 3) (make-pos 0 1)))
(define 4queens-solution#2 (list (make-pos 2 3) (make-pos 0 2) (make-pos 3 1) (make-pos 1 0)))

(: render-queens (Number [ListOf Pos] -> %Image))
; produces the rendering of an NxN chess board with the queens placed
(define (render-queens n queens-lst)
  (local
    [
     (define hori (apply beside (build-list n (lambda (_) SQUARE-GRID))))
     (define board (apply above (build-list n (lambda (_) hori))))
     ]
    (foldl
     (lambda (qp acc)
       (place-image/align
        QUEEN-IMG
        (* (pos-x qp) TILE-SIZE)
        (* (pos-y qp) TILE-SIZE)
        "left"
        "top"
        acc)) board queens-lst)))

(: threatening? (Pos Pos -> Boolean))
; produces #true if queens are a threat to each other
(check-expect (threatening? (make-pos 0 0) (make-pos 0 0)) #true)
(check-expect (threatening? (make-pos 1 1) (make-pos 0 0)) #true) ; first queen is in the center
(check-expect (threatening? (make-pos 1 1) (make-pos 1 0)) #true)
(check-expect (threatening? (make-pos 1 1) (make-pos 2 0)) #true)
(check-expect (threatening? (make-pos 1 1) (make-pos 3 1)) #true)
(check-expect (threatening? (make-pos 1 1) (make-pos 0 1)) #true)
(check-expect (threatening? (make-pos 1 1) (make-pos 0 2)) #true)
(check-expect (threatening? (make-pos 1 1) (make-pos 2 0)) #true)
(check-expect (threatening? (make-pos 1 1) (make-pos 2 1)) #true)
(check-expect (threatening? (make-pos 1 1) (make-pos 2 2)) #true)
(check-expect (threatening? (make-pos 1 1) (make-pos 2 3)) #false)
(define (threatening? p1 p2)
  (local
    [
     (define slope-x (- (pos-x p2) (pos-x p1)))
     (define slope-y (- (pos-y p2) (pos-y p1)))
     ]
    (or (= (pos-x p2) (pos-x p1)) ; same horizontal
        (= (pos-y p2) (pos-y p1)) ; same vertical
        (= (abs (/ slope-y slope-x)) 1)))) ; same diagonal

(: threatening-existing? (Pos [ListOf Pos] -> Boolean))
; produces #true if the given new queen threatens any existing queens
(define (threatening-existing? new-qp board)
  (ormap (lambda (existing)
           (threatening? new-qp existing)) board))

(: n-queens (Number -> (mixed [ListOf Pos] False)))
; places n queens on board; otherwise, returns #false
(check-expect (n-queens 1) (list (make-pos 0 0)))
(check-expect (n-queens 2) #false)
(check-expect (n-queens 3) #false)
(check-expect (n-queens 4)
              (list (make-pos 3 2) (make-pos 2 0) (make-pos 1 3) (make-pos 0 1)))
(check-expect (n-queens 5)
              (list (make-pos 4 3) (make-pos 3 1) (make-pos 2 4) (make-pos 1 2) (make-pos 0 0)))

(define (n-queens n)
  (local
    [
     ; [ListOf Pos] -> [ListOf Pos] Or False
     (define (find-solution-board board)
       (if (= (length board) n) ; if its a solution
           board
           (find-solution/list (place-queens board n))))

     ; [ListOf [ListOf Pos]] -> [ListOf Pos] Or False
     (define (find-solution/list board-lst)
       (cond [(empty? board-lst) #false]
             [else
              (local [(define try (find-solution-board (first board-lst)))]
                (if (false? try)
                    (find-solution/list (rest board-lst))
                    try))]))
     ]
    (find-solution-board empty)))

(: place-queens ([ListOf Pos] Number -> [ListOf [ListOf Pos]]))
; generates the range of posibilities where a queen can be placed without
; threatening other queens
(define (place-queens existing-queens n)
  (local
    [
     ; -> ListOfPos
     (define every-pos
       (foldl
        (lambda (x base)
          (append base
                  (map (lambda (y)
                         (make-pos x y))
                       (range 0 n 1)))) empty (range 0 n 1)))
     ; ListOfPos
     (define valid-queens
       (filter (lambda (pos)
                 (not (threatening-existing? pos existing-queens))) every-pos))
     ]
    (map (lambda (valid)
           (cons valid existing-queens)) valid-queens)))
