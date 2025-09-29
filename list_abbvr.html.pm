#lang pollen

◊h1{List Abbreviation}

◊slide{
◊h2{The problem with cons}

◊racket-code-block{
(cons
 "bob"
 (cons
  "carl"
  (cons
   "dana"
   (cons
    "erik"
    (cons
     "frank"
     (cons
      "grant"
      (cons
       "hank"
       (cons
        "ian"
        (cons
         "john"
         (cons
          "karel"
          '()))))))))))
}
}
When you have lists with lots of elements, ◊code{cons} lists become hard to read and write! There's a lot of nesting and parens at the end, along with 10 ◊code{cons}'s!

Instead, we can write this with ◊code{list} instead:
◊slide{
◊racket-code-block{
(list "bob" "carl" "dana" "erik" "frank" "grant" "hank" "ian" "john" "karel")
}}
◊code{list} takes in any N number of arguments and makes a list

Underneath, it is just ◊code{cons} if you run it in the evaluations window.

◊h2{Change the language level}
Change the language level to "Beginning Student with List Abbreviations" in the bottom left menu bar to make it so all ◊code{cons} lists print in the abbreviated format.

The abbrevated format makes lists easier to visually read and type, but underneath, it is still just a ◊code{cons} list. There is still an empty even when using ◊strong{list}: ◊code{(rest (list 5)) == empty}. It's important to note that the ◊code{list} and ◊code{cons} way of building the list are equivalent, just different notation.

◊code{(check-expect (cons 5 (cons 7 empty)) (list 5 7) #true)}

◊slide{
◊table{
    ◊thead{
        ◊th{short-hand}
        ◊th{long-hand}
    }
    ◊tbody{
        ◊tr{
            ◊td{◊code{(list "ABC")}}
            ◊td{◊code{(cons "ABC" '())}}
        }
        ◊tr{
            ◊td{◊code{(list #false #true)}}
            ◊td{◊code{(cons #false (cons #true '()))}}
        }
        ◊tr{
            ◊td{◊code{(list 1 2 3)}}
            ◊td{◊code{(cons 1 (cons 2 (cons 3 '())))}}
        }
        ◊tr{
            ◊td{◊code{(list (make-pos 1 4) (make-pos 9 2))}}
            ◊td{◊code{(cons (make-pos 1 4) (cons (make-pos 9 2) empty))}}
        }
    }
}
}
◊slide{
◊h2{When to use cons vs list?}
This doesn't mean we will never use ◊code{cons} again! 

◊h3{cons}
◊code{cons} is better for continously adding things into a list, where you don't know how long the list can be(dynamically building them)!

◊video[#:loop "" #:muted "" #:autoplay "" #:width "640" #:height "360"]{
    ◊source[#:src "./images/build_cons.mp4" #:type "video/mp4"]{}
}

◊h3{list}
whereas ◊code{list} is more useful for typing out lists when we know the length of them ahead of time.
}
95% of the time, ◊code{cons} will be used in ◊strong{functions}, because sometimes you add things onto a list and sometimes you don't, and you should use ◊code{list} when writing ◊strong{examples/tests} because you know the amount there are ahead of time

◊slide{
◊h2{Exercises}

◊h3{List to Cons}
◊racket-code-block{
; Fill in the ... and make the tests pass:
; Use "cons" and "empty" to form the equivalent of the following lists: 
(check-expect (list 7 2 1 3 5) ...)
(check-expect (list (list "he" 0) (list "it" 1) (list "lui" 14)) ...)
(check-expect (list 1 (list 1 2) (list 1 2 3)) ...)
}
}

◊slide{
◊h3{Cons to List}
◊racket-code-block{
; Fill in the ... and make sure the tests pass:
; Use "list" to form the equivalent of the following lists:
(check-expect (cons "apple" (cons "banana" (cons "chestnut" empty))) ...)
(check-expect (cons (cons "apple" empty) (cons (cons "banana" (cons "chestnut" empty)) empty)) ...)
(check-expect (cons (list 1 2) (list 3 4)) ...)
(check-expect (cons (cons empty empty) (cons empty empty)) ...)
}
}

◊slide{
◊h3{Cons to Lists with Structs}
◊racket-code-block{
(define-struct person [fname lname])
(define bob (make-person "bob" "smith"))
(define lisa (make-person "lisa" "lee"))
(define jack (make-person "jack" "chan"))

; Use "list" to form the equivalent of the following lists:
(check-expect (cons bob (cons lisa (cons jack empty))) ...)
(check-expect (cons jack (cons bob (cons lisa empty))) ...)
(check-expect (person-lname (first (rest (list lisa jack)))) ...)
}
}