#lang pollen

◊h1{Lambda}

Let's revist the idea of an ◊strong{expression} vs a ◊strong{statement}

◊racket-code-block{
; statement:
(define a 3)

; expression:
3
(* 3 1)
a
}
Statements do not produce anything until you use the name of it, only then is it converted to an expression.

A lambda can be thought of as the ◊strong{expression} form of a function, since all functions we've wrote up until now were statements.
◊racket-code-block{
; statement:
(define (meow x) (+ 1 x))

; expression:
(lambda (x) (+ 1 x))
meow

; lambdas can be bound to variables, thus turning them back into statements
(define meow2 (lambda (x) (+ 1 x)))
}

The evaluation rules for lambda is the exact same as a function, so nothing too interesting. ◊code{meow} and ◊code{meow2} are identical, so prefer ◊code{(define (meow) ...)} as it is less parenthesis. This is called "syntactic sugar", whereby the language has more nicer/sweeter ways of writing things.

◊h2{When to use lambda?}
Making code shorter instead of using local. Use this ◊strong{only} for small functions or functions you forsee will only be used once.
◊racket-code-block{
; add-n: ([ListOf Number] Number -> [ListOf Number])
; adds N to every number in the list
(check-expect (add-n (list 0 4 1) 2)
              (list 2 6 3))
(define (add-n num-lst inc)
  (local
    [; add-to : (Number -> Number)
     (define (add-to i)
       (+ i inc))]
    (map add-to num-lst)))

; instead, write the local function with lambda:
; much shorter! 1 liner
(define (add-n num-lst inc)
  (map (lambda (i) (+ i inc)) num-lst))
}

Remember, the main point of the ◊code{local} is that we need to stick a function inside another function so it can capture its variables! But we can also do that by just writing ◊em{lambda}(a function expression) also.

So use lambda to abstract when you think a function is simple or will never be called more than once.

◊h2{Returning functions}
We've only had functions that produce primitive values(strings, booleans, numbers) but we can have functions that produce functions to reduce repitition and abstract. ◊strong{NOTE}: This is super rare and we won't be doing this in this course all that much

◊racket-code-block{
; warning: (String -> String)
(define (warning text)
    (string-append "WARNING: " text))

; note: (String -> String)
(define (note text)
    (string-append "Note: " text))

(warning "Low battery")  ; → "WARNING: Low battery"
(note "Remember to save") ; → "Note: Remember to save"
}

Instead we can create an abstract ◊code{make-prefixer} function
◊racket-code-block{
; make-prefixer : (String -> (String -> String))
(define (make-prefixer prefix)
  (lambda (text)
    (string-append prefix text)))

(define warning (make-prefixer "WARNING: "))
(define note (make-prefixer "Note: "))

(warning "Low battery")  ; → "WARNING: Low battery"
(note "Remember to save") ; → "Note: Remember to save"
}

A better example of a function producing another function can be seen in the builtin function to ISL called ◊code{compose}
◊racket-code-block{
; letter-count : ([ListOf String] -> Number)
; counts up the letters in the list
(check-expect (word-count (list "moo" "woof")) 7)
(define (word-count lst)
  (foldl (lambda (str base)
           (+ (string-length str) base)) 0 lst))

; instead, we can use compose, which will make a string-length adder here
(define (word-count-BETTER lst)
  (foldl (compose + string-length) 0 lst))
}