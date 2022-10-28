#lang pollen

◊h1{Structures of Data}

◊h2{Related Data}

There's a problem with using variables to group related data. This code will crash: 
◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"
(define firstname \"edward\")
(define lastname \"norton\") ; who's last name is this?
(define age 18)
(define balance 99)
(define single #true)

; would need to find new names for 
; these variables because they already exist:
; e.g firstname2, lastname2, age2,
(define firstname \"marla\")
(define lastname \"singer\")
(define age 24)
(define balance 55)
(define single #false)

; same with these below
(define firstname \"tyler\")
(define lastname \"durden\")
(define age 18)
(define balance 0)
(define single #false)
")
}

Variables cant be defined with the same name so you have to rename so these have to be unique, e.g: ◊code{firstname2}, but it gets tedious when you reach a couple of people. 
Another problem is that there is no relationship/linking of the variables: ◊code{ firstname, lastname, age and balance}. We humans know they are related to a singular person, the ◊code{age} variable is Edwards's, not Marla's because of their close proximity and spacing of each other, and their variable names BUT what's really happening is these are just pieces of data floating in space like the image below. Nothings preventing anyone from moving edwards lastname variable to somewhere random and way below:

◊img[#:src "images/scattered_variables.png"]{}


◊h2{Structs}

◊code{Structs} can help us solve the problem of keeping related pieces of data together without creating a ton of variables. Structs are collections of data relating to 1 "unit" of something, e.g a person, a dog, a 2D point, etc. A real life analogy would be a drink and a straw, things that you can generally expect if you have of them, you might as well have the other.

◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"(define-struct person (fn ln age balance single))

; create instances of persons
(define p1 (make-person \"edward\" \"norton\" 18 99 #true))
(define p2 (make-person \"marla\" \"singer\" 24 55 #false))
(define p3 (make-person \"tyler\" \"durden\" 18 0 #false))

; to get the pieces out of a structure out:
; aka selectors
(person-fn p1) ; edward
(person-ln p2) ; singer 
(person-balance p3) ; 0 balance from tyler 
")
}

◊h2{Struct Definition Syntax}
◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"(define-struct <NAME> (<FIELDNAME> ...))

; to create an instance of the struct:
(make-<NAME> <data>...)
; where <data> are strings, numbers, bools or images 

; which creates accessors
(<NAME>-<FIELDNAME> <INSTANCE>)

; and a predicate to check if its an instance of <NAME>
(<NAME>? <INSTACE>) ; returns #true or #false
")
}

◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"(define-struct person (fn ln age balance single))
(define-struct dog (name age breed))
(define p3 (make-person \"tyler\" \"durden\" 18 0 #false))
(define d1 (make-dog \"flipper\" 7 \"pug\"))

(dog? p3) ; false
(dog? d1) ; true
(dog? \"yay\") ; false
")
}

◊h2{Conclusion}

Structs introduce a new data type to our classic 3 ◊code{(numbers, strings, and booleans)}, just like how functions introduce a new operation to the classic ◊code{string-append + - *}. It groups units of data close together in 1 whole block.

◊h2{Practice Problems with Structs}

◊a[#:href ◊(practice-url "structs")]{Structs practice}

◊h2{Videos}

◊a[#:href "https://www.youtube.com/watch?v=EZBmgp2QCuA&list=PLitFP8FdScfE5nwRovCwdhhW9RTx98q3J&index=19"]{Intro to Structs}