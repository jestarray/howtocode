#lang pollen

◊h1{Lists}

◊h2{The Problem}
We have data that we don't know the size of upfront. Say we want to average the grades of all 3 students in our class.

◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"; average-3-grades: (Number Numer Number -> Number)
(define (average s1 s2 s3)
    (/ (+ s1 s2 s3) 3))

; average-4-grades: (Number Numer Number Number -> Number)
; need to re-write to handle 4 numbers
(define (average s1 s2 s3 s4)
    (/ (+ s1 s2 s3 s4) 4))
")
}
What if we have 4 or more? We'd have to keep rewriting our code to handle an ◊strong{arbitrary} amount of students! Lists will make it so we don't have to. Or consider our ripple program in 8.07. How many times does the user click?

◊h2{What is a list?}
A list is a kind of ◊strong{compound value}, an object that Racket treats as a single value but that nevertheless contains other values inside itself. Imagine a shopping list—you write "milk, eggs, cheese" on a piece of paper, then fold up the paper and put it in your pocket. While it's folded up, you can think of the list as a single entity. It's only later, at the store, where you need to go "into" the list and retrieve the individual pieces of information it contains.

◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
";empty and '() are exactly the same, you can imagine (define empty '())
empty
'()

(define stuff (cons #false empty)) ; 1 element list
(define grocceries (cons \"eggs\" (cons \"chips\" empty)))
(define numbers-ls (cons 4 (cons 3 (cons 6 empty))))
(define imgs (cons (square 30 \"solid\" \"red\") 
                (cons (circle 30 \"solid\" \"red\") empty)))
(define op (cons (* 2 4) (cons 3 (cons (* 3 9) empty))))

; first: (ListOfAny -> Any)
; produces the first value of a non-empty list
(first stuff) ; produces #false
(first grocceries) ; produces \"eggs\"
(first numbers-ls) ; produces 4

; rest: (ListOfAny -> ListOfAny|empty)
; produces a list with the first element excluded
(rest stuff) ; produces empty
(rest grocceries) ; produces (cons \"chips\" empty)
(rest numbers-ls) ; produces (cons 3 (cons 6 empty))

; empty: (Any -> Boolean)
(empty? 123) ; produces #false
(empty? grocceries) ; produces #false
(empty? empty) ; produces #true

; length: (ListOfAny -> Number)
; produces the total amount of items in a list
(length stuff) ; produces 1
(length grocceries) ; produces 2
(length op) ; produces 3
")
}

◊h2{Nested Diagram}
◊img[#:src "images/list_nest.png" #:style "width: auto"]{}

◊figure[#:style "width: initial;"]{
◊img[#:src "images/dolls.png" #:style "width: auto"]{
}
◊figcaption{
◊a[#:href "https://commons.wikimedia.org/wiki/File:Matryoshka_transparent.png"]{User:Fanghongderivative Matryoshka Dolls CC BY-SA}
}
}

◊h2{Box and Pointer Diagram}
Box and pointer diagrams are much more common as they take up less space and are easier to follow as the amount of items increases.
◊img[#:src "images/list_train.png" #:style "width: auto"]{}

◊figure[#:style "width: initial"]{
◊img[#:src "images/flying_scotsman_train.jpg" #:style "width: auto"]{}
◊figcaption{◊a[#:href "https://commons.wikimedia.org/wiki/File:%27Flying_Scotsman%27_(40944346730).jpg" #:style "width: auto; text-align: center;"]{Peter Trimming from Croydon, England, CC BY 2.0}}
}

◊h2{Concept Check}
What should this produce? ◊code{(cons (+ 1 1) (cons 1 empty))}
◊ul{
    ◊li{a.◊code{3}}
    ◊li{b.◊code{2}}
    ◊li{c.◊code{(cons 3 empty)}}
    ◊li{d.◊code{(cons 2 (cons 1 empty))}}
}
◊details{◊summary{answer} d}

GIVEN THIS:
◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"(define L1 (cons \"James\" (cons \"Alice\" (cons \"Bob\" empty))))
(define L2 (cons 1 empty))
")
}
What is the value produced by the expression ◊code{(first L1)}?
◊ul{
    ◊li{a. ◊code{(cons "James Alice Bob" empty)}}
    ◊li{b. ◊code{(cons "Alice" (cons "Bob" empty))}}
    ◊li{c. ◊code{(cons "Bob" empty)}}
    ◊li{d. ◊code{"James"}}
    ◊li{e. ◊code{"Bob"}}
    ◊li{f. ◊code{empty}}
}
◊details{◊summary{answer} d}

What is the value produced by the expression ◊code{(rest L1)}?
◊ul{
    ◊li{a. ◊code{(cons "James Alice Bob" empty)}}
    ◊li{b. ◊code{(cons "Alice" (cons "Bob" empty))}}
    ◊li{c. ◊code{(cons "Bob" empty)}}
    ◊li{d. ◊code{"James"}}
    ◊li{e. ◊code{"Bob"}}
    ◊li{f. ◊code{empty}}
}
◊details{◊summary{answer} b}

What is the value produced by the expression ◊code{(empty? L2)}?
◊ul{
    ◊li{a.◊code{(cons 1 empty)}}
    ◊li{b.◊code{empty}}
    ◊li{c.◊code{#true}}
    ◊li{d.◊code{#false}}
}
◊details{◊summary{answer} d}


What is the value produced by the expression ◊code{(empty? (rest L2))}?
◊ul{
    ◊li{a.◊code{(cons 1 empty)}}
    ◊li{b.◊code{empty}}
    ◊li{c.◊code{#true}}
    ◊li{d.◊code{#false}}
}
◊details{◊summary{answer} c}

How many elements does this list have? ◊code{(cons 4 empty)}
◊ul{
    ◊li{a. ◊code{1}}
    ◊li{b. ◊code{2}}
    ◊li{c. ◊code{3}}
    ◊li{d. ◊code{4}}
}
◊details{◊summary{answer} a}

Write a function swap that consumes a two-element list and produces a new two-element list containing the elements of the original list in the opposite order. For example, (swap (cons 3 (cons 2 empty))) produces (cons 2 (cons 3 empty)).
◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"; swap: (ListOfAny -> ListOfAny)
; consumes a two element list and swaps their order
(check-expect (swap (cons 3 (cons 2 empty)))
              (cons 2 (cons 3 empty)))

(define (swap ls)
    (... ls))
")
}
◊details{◊summary{answer}
◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"(define (swap ls)
    (cons (first (rest ls)) 
        (cons (first ls) empty)))
")
}
}