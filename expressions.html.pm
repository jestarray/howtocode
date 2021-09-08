#lang pollen

◊h1{Expressions and Evaluation rules}

◊h2{Rules to form an expression}

◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket" 
"; comments are ignored and are for you to jott down notes
#|this is a multi-line comment|#
(<operator> <argument-1> <argument-2> ...)

(+ 2 4) ; evaluates to the value 6! yay!
")
}

where:
◊ul{
    ◊li{◊code{(}}
    ◊li{◊code{+} , is the name of the ◊strong{operator}, also sometimes called a ◊strong{function}}
    ◊li{◊code{2} , is the 1st ◊strong{argument} consumed by the operator, also sometimes called ◊strong{operands}}
    ◊li{◊code{4} , is the 2nd argument/operand}
    ◊li{◊code{)}}
}

It reads: Call the + function with arguments 2 and 4

The result of ◊strong{executing} the function/operation/expression is a ◊strong{value}, in this case the number 6.


◊h2{Evaluating Expressions in detail}

Operands/Arguments can also be expressions themselves that:
◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket" 
"; problem: what does this evaluate to?
(+ 2 4 (* 5 5) (- (+ 3 3) 2) 1)
")
}

◊steps{
    ◊step{Look from Left -> Right and see if there are expressions that are not yet values
Starting from left to right, in order for 1st + to do its job, all arguments need to be reduced to a value
    ◊code{2, 4, 1} are already values but ◊code{(* 5 5)} is not a value, it's an expression, thus we need to evaluate it resulting to 25
}
    ◊step{Evaluate the sub-expressions and turn them into values
    ◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket" 
"(+ 2 4 (* 5 5) (- (+ 3 3) 2) 1)
; turns into: 
(+ 2 4 25      (- (+ 3 3) 2) 1) ; (* 5 5) above turns into 25
; turns into:
(+ 2 4 25         (- 6 2) 1) ; (+ 3 3) above turns into 6, notice we're back out to the substraction now
; turns into:
(+ 2 4 25 4 1) ; (- 6 2) above turns into 4
")
    }}
    ◊step{
        Finally the + operator can do its job
        36
    }
}

Notice in the nested expression: 
◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"(- (+ 3 3) 2)")
}
after evaluating the inside: ◊code{(+ 3 3)}, we're back outside to the ◊code{-} operation, ◊code{(- 6 2)}. So in summary the rules for evaluation are left to right from inside to out.

◊h2{Inexact numbers}

Numbers like ◊code{pi} or ◊code{(sqrt 2)} are decimal numbers that go on infinitely but computers are limited in terms of memory. These numbers will be printed with a ◊code{#i} to indicate they are close but ◊emphasis{inexact}
◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"(sqrt 2)
#i1.4142135623730951
pi
#i3.141592653589793
")
}

◊h3{Check your understanding!}

◊(q "What does (+ (- (- 9 1) 2) 7 (* 3 2) 1) evaluate to?"
◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket" 
"; problem: what does this evaluate to?
(+ (- (- 9 1) 2) 7 (* 3 3) 1)
; step 1: we first need to evaluate (- 9 1) to 8
(+ (- 8 2)       7 (* 3 3) 1)
; step 2: then evaluate (- 8 2) to 6
(+ 6             7 (* 3 3) 1)
; step 3: we're still not done yet (* 3 3) to 9 
(+ 6             7 9 1)
; step 4: now we can add them all up:
23
")
}
)