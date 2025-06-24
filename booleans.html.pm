#lang pollen
◊h1{Booleans}
◊; Introduced after variables for more interesting examples
◊h2{What are booleans?}
They are the values ◊code{#true} or ◊code{#false}, most often the result comparison functions, e.g functions that answer a question, such as ◊code{> , < , = , <= , >= , string=? , etc...}. Another term for these are "predicates" and in racket you can tell whether a boolean will be produced if the name of the operator/function has a ◊code{?}.

◊racket-code-block{
; examples
(define health 100)
(> health 0) ; alive!
(= health 0) ; dead!
(< 1 2)
(>= 3 3)
(<= 1 2)

(define username "bob123")

(string=? username "bob123")
(string=? username "bob124")

; becareful, it's 1 charater off from string=?
; tests the type of:
(string? "adsf")
(string? 9999)

(number? 9999)
(number? "asdf")
}

Booleans go hand in hand with conditional expressions like ◊code{if}

◊h2{If statements}

◊code{if} statements allow decisions to be made based on a question.
◊racket-code-block{
; space out for readability rather than all 1 line
(if <question>  ; if either true or false, it will error
     <expression> ; true branch
     <expression>) ; false branch

(if #true
    "I am the true branch :)"
    "I am  the false branch >:(")
}

◊h2{If Practice Problems}

You may notice that DrRacket also highlights in black the branch that did not run which we will go into more detail in the later sections, don't worry about it for now.

◊a[#:href ◊(practice-url "if_bool_comparisons")]{If boolean comparisons}

◊h2{Cond statements}
Like ◊code{if} statements but can handle more than 2 cases, in some ways it's syntactic sugar for nested ◊code{if} statements, also known as ◊code{else if} or ◊code{case} in other languages

◊racket-code-block{
; space out for readability rather than all 1 line
(cond 
    [<question> <answer>]  ; if question evalutes to true, answer will run, otherwise keep going down until you hit the else case
    [<question> <answer>]  ; 
    ;... can have unlimited amount of branches
    [else <answer>]) ; else is the catch all branch, 

; example
; james, alice, mom
(define name "james")

(cond 
    [(string=? name "james") "hey there handsome"] 
    [(string=? name "alice") "hey girl"] 
    [(string=? name "mom") "hello mother"] 
    [else (string-append name ", who the heck are you?")]) ; else is the catch all branch, 
}

◊h2{Logical operations}
And, Not, Or, short circuting
◊racket-code-block{
; logical operators
(and #true #false #true) ; all have to be true in order to produce true, else false
(or #true #false #true) ; only one has to be true to produce true, else false
(not #true) ; inverts false to true and true to

; short circuting to save computation
; for and, as soon as a #false is hit SKIP checking the rest as because it will eveluate to #false anyways
(and #false (<= (+ 1 2) (+ 2 3))) 

; for or, as soon as a #true is hit SKIP checking the rest as because it will eveluate to #true anyways
(or #false (= (+ 1 1) 2) #true (= 999 99)) 

; useful for combining constraints:
(define age 11)
(define height 5)

(if (and (= age 10) (>= height 5))
    "yes you can ride"
    "no you can't ride")
}

These exercises put if statements all in 1 line because it is training you to distinguish parentheses blocks. You should absolutely space out your code for readability.

◊h2{If Logical Practice Problems}

◊a[#:href ◊(practice-url "if_logical")]{If logical}

◊h2{Videos}

◊a[#:href "https://www.youtube.com/watch?v=_25wDPmuCKc&list=PLitFP8FdScfE5nwRovCwdhhW9RTx98q3J&index=12"]{Booleans video}

◊a[#:href "https://www.youtube.com/watch?v=O8c4arZ0FW8&list=PLitFP8FdScfE5nwRovCwdhhW9RTx98q3J&index=13"]{Logical Comparison video}