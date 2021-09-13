#lang pollen
◊h1{Booleans}
◊; Introduced after variables for more interesting examples
◊h2{What are booleans?}
They are the values ◊code{#true} or ◊code{#false}, most often the result comparison functions, e.g functions that answer a question, such as ◊code{> , < , = , <= , >= , string=? , etc...}. Another term for these are "predicates".

◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"; examples
(define health 100)
(> health 0) ; alive!
(= health 0) ; dead!
(< 1 2)
(>= 3 3)
(<= 1 2)

(define username \"bob123\")

(string=? username \"bob123\")
(string=? username \"bob124\")

; becareful, it's 1 charater off from string=?
; tests the type of:
(string? \"adsf\")
(string? 9999)

(number? 9999)
(number? \"asdf\")
")
}
go hand and hand with conditional expressions like ◊code{if}

◊h2{If statements}
◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"; space out for readability rather than all 1 line
(if <question>  ; if either true or false, it will error
     <expression> ; true branch
     <expression>) ; false branch
")
}

DrRacket also highlights in black the branch that did not run which we will go into more detail in the later sections

◊h2{Cond statements}
Like ◊code{if} statements but can handle more than 2 cases, in some ways it's syntactic sugar for nested ◊code{if} statements, also known as ◊code{else if} or ◊code{case} in other languages

◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"; space out for readability rather than all 1 line
(cond 
    [<question> <answer>]  ; if question evalutes to true, answer will run, otherwise keep going down until you hit the else case
    [<question> <answer>]  ; 
    ;... can have unlimited amount of branches
    [else]) ; else is the catch all branch, 

; example
(define tempature 3)
(cond 
    [(< tempature 0) \"so cold\"] 
    [(> 50 tempature) \"still very cold\"] 
    [(> 100 tempature) \"burning hot!\"] 
    ;... can have unlimited amount of branches
    [else #f]) ; else is the catch all branch, 
")
}

◊h2{Logical operations}
And, Not, Or, short circuting
◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"; logical operators
(and #true #false #true) ; all have to be true in order to produce true, else false
(or #true #false #true) ; only one has to be true to produce true, else false
(not #true) ; inverts false to true and true to

; short circuting to save computation
; for and, as soon as a #false is hit SKIP checking the rest as because it will eveluate to #false anyways
(and #false (<= (+ 1 2) (+ 2 3))) 

; for or, as soon as a #true is hit SKIP checking the rest as because it will eveluate to #true anyways
(or #false (= (+ 1 1) 2) #true (= 999 99)) 
")
}

◊h2{Practice Problems}

◊a[#:href "https://jestlearn.com/#if_bool_comparisons"]{If boolean comparisons}
◊a[#:href "https://jestlearn.com/#if_logical"]{If logical}