#lang pollen
◊h1{Syntax Cheat Sheet}

◊a[#:href "https://docs.racket-lang.org/htdp-langs/beginner.html"]{Racket BSL docs}

◊h2{basic data types}
◊racket-code-block{
123 ; numbers
"yayy" ; strings
#false #true ; booleans
}

◊h2{expressions}
◊racket-code-block{
;; RULES:
(<operator> <argument-1> <argument-2> ...)

;; examples: 
(+ 2 4)

(+ 2 4 (* 3 6 (+ 1 1)))
}

◊h2{define variables}
◊racket-code-block{
;; RULES
(define <NAME> <VALUE>)

;; examples:
(define poo 3)
(define name "bob")
(define x (/ 100 2))
}

◊h2{if and cond}
◊racket-code-block{
;; RULES
(if <BOOL-EXPRESSION> <EXPRESSION> <EXPRESSION>)

;; examples:
(if (string=? "hi" "bye") "yarr" "meow")  ; produces meow
(if (>= 3 0) (+ 1 1) (+ 4 3))  ; produces 2

;; cond
(cond [<QUESTION> <ANSWER>]
      ...
      [else <ANSWER>])

;; examples:
(define ran-num 3)

(cond [(< ran-num 3) "<3 looks like a heart"]
      [(= ran-num 3) "these numbies are equal"]
      [else 1234])
;; produces: 
"these numbies are equal" ; 
}

◊h2{functions}
◊racket-code-block{
;; RULES

(define (<NAME> <ARG-NAME1> ...)
    <BODY>)

;; examples: 
(define (area-of-circle r)
    (* pi r r))

(define (greet name)
    (string-append "Hey " name))
}

◊h2{structs}
◊racket-code-block{
;; RULES
(define-struct <NAME> (<FIELD-NAMES> ...))

; creating INSTANCE 
(make-<NAME> <DATA> ...)

; get pieces out
(<NAME>-<FIELD-NAME> <INSTANCE>)

; test instance type
(<NAME>? <DATA>)

;; examples:
(define-struct dog (name age breed))

; create an instance of a dog
(define d1 (make-dog "flipper" 5 "pug"))

; get the pieces out
(dog-name d1) ; produces flipper
(dog-age d1) ; produces 5

; test instances
(dog? d1) ; produces true
(dog? 321) ; produces false
}


For people who have already programmed before, here is the more ◊strong{advanced} ◊a[#:href "https://docs.racket-lang.org/racket-cheat/index.html"]{quick reference card}.

