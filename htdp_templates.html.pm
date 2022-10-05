#lang pollen

◊h1{Templates and Outlines}

Templates, or as I'd like to call them, "outlines", is the bare minimum baseline to kickstart writing a function. It's akin to laying out all your tools neatly before picking which one to use, or like an artist drawing a rough outline/sketch as a baseline. If you've tried visual block based languages like ◊a[#:href "https://scratch.mit.edu/"]{Scratch}, it lays out all the blocks for you that you can use, and this is what tempaltes accomplish, to gather all the available puzzle pieces(e.g parameters and basic structure) we can use, as the alternative is staring at a blank page stunned. As you program more and more, you'll be able to template problems in your head.

◊; TypeOf , instead of "atomic non-distinct" ,general, broad

◊;  InstanceOf , instead of "atomic distinct", specific, narrow

◊h2{Simple Base Data(concrete)}
◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"(define (<FUN-BASE-TEMPLATE> arg1)
  (... arg1))

; double: (Number -> Number)
; produces double the given number

(check-expect (double 2) 4)
(check-expect (double 3.5) 10)
; stub (define (double n) 0)

(define (double n)
  (... n))
")}

◊h2{Enum}

Enums list all finite possibilities of a given catatgorey of data you want to represent

◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"; A TrafficLight is one of the following Strings:
; – \"red\"
; – \"green\"
; – \"yellow\"
; interpretation the three strings represent the three 
; possible states that a traffic light may assume

; TEMPLATE should match amount of cases in the type above, in this case 3 branches:
(define (<FUN-ENUM-TEMPLATE> st)
  (cond
    [... st ...]
    [... st ...]
    [... st ...]))

; traffic-light-next: (TrafficLight -> TrafficLight)
; yields the next state given current state st
(check-expect (traffic-light-next \"red\") \"green\")

(define (traffic-light-next st)
  (cond
    [(string=? \"red\" st) ...]
    [(string=? \"green\" st) ...]
    [(string=? \"yellow\" st) ...]))
")
}


◊h2{Intervals}

Use an interval when the information to be represented is numbers within a certain range. Integer[0, 10] is all the integers from 0 to 10 inclusive; Number[0, 10) is all the numbers

◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"; Countdown is Integer[0, 10]
; interp. the number of seconds remaining to liftoff

(define C1 10)  ; start
(define C2 5)   ; middle
(define C3 0)   ; end
 
; fn-for-countdown: (Number -> ???)

(define (fn-for-countdown cd)
  (... cd))
")}

◊; aka Itemization
◊h2{Union}
Union(aka itemization) describes the case when there are two or more different ◊strong{types} of data.

◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"; ValidID is one of:
; #false
; Number
; interp. #false means there is no ID while Number is the ID

; TEMPLATE should match the number of cases above and check with typeof: \"<type>?\" 
(define (<id-fun> x)
  (cond [(boolean? x) ...]
        [(number? x) ...]))

; pull-over-id-check?: (ValidId -> Boolean)
; returns true if the person has a valid id, otherwise false
(define (pull-over-id-check? x)
  (cond [(boolean? x) #false]
        [(number? x) #true]))
")}

◊h2{Compound Data aka Structs}

◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"(define-struct person (name age))
; Person is (make-ball String Number)
; interp. a person comrpises of a name and age

(define P1 (make-person \"bob\" 10))

; (: person-name ((PersonOf String Number) -> String))
; (: person-age ((PersonOf String Number) -> Number))
; (: person? (Any-> Boolean))

; TEMPLATE should list all the field accessors
(define (fn-for-person p)
  (... (person-name p)
       (person-age p)))
")}

◊h2{Recursive Functions}

◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"; ListOfString is one of:
;  - empty
;  - (cons String ListOfString)
; interp. a list of strings

(define LOS-1 empty)
(define LOS-2 (cons \"a\" empty))
(define LOS-3 (cons \"b\" (cons \"c\" empty)))

#;
(define (fn-for-los los)
  (cond [(empty? los) (...)]                   ;BASE CASE
        [else (... (first los)                 ;String
                   (fn-for-los (rest los)))])) ;NATURAL RECURSION
;             /
;            /
;       COMBINATION
")}

◊h2{Data Driven Templates}
◊table{
  ◊thead{
    ◊th{Type of Data}
    ◊th{cond question (if applicable)}
    ◊th{Body or cond answer(if applicable)}
  }
  ◊tbody{
    ◊tr{
      ◊td{◊strong{Base Generic}
            ◊ul{
            ◊li{Number}
            ◊li{String}
            ◊li{Boolean}
            ◊li{Image}
            }
         }
      ◊td{Appropriate Predicate
      ◊ul{
        ◊li{◊code{(number? x)}}
        ◊li{◊code{(string? x)}}
        ◊li{◊code{(boolean? x)}}
        ◊li{◊code{(image? x)}}
        ◊li{◊code{(and (<= 0 x) (< x 10))}}
      }
      }
      ◊td{Expression that operates on the parameter.
          (... x)}
    }
    ◊tr{
      ◊td{◊strong{Base Concrete}
            ◊ul{
            ◊li{◊code{"red"}}
            ◊li{◊code{#f}}
            ◊li{◊code{empty}}
            ◊li{◊code{5}}
            ◊li{◊code{etc}}
            }
         }
      ◊td{Appropriate Predicate
      ◊ul{
        ◊li{◊code{(string=? x "red")}}
        ◊li{◊code{(false? x)}}
        ◊li{◊code{(empty? x)}}
        ◊li{◊code{(= x 5)}}
      }
      }
      ◊td{Expression that operates on the parameter.
          (... x)}
    }
    ◊tr{
      ◊td{◊strong{One of}
            ◊ul{
            ◊li{◊code{enum}}
            ◊li{◊code{union(aka itemization)}}
            }
         }
      ◊td{}
      ◊td{
        Cond with one clause per subclass of one of.
◊pre{◊code{
(cond [<question1> <answer1>]
      [<question2> <answer2>])}}

Where each question and answer expression is formed by following the rule in the question or answer column of this table for the corresponding case. A detailed derivation of a template for a one-of type appears below.

Always use else for the last question for itemizations and large enumerations. Normal enumerations should not use else.

Note that in a mixed data itemization, such as

◊pre{◊code{
;; Measurement is one of:
;; - "high"
;; - "low"
;; - Number
}}
the cond questions must be guarded with an appropriate type predicate. In particular, the first cond question for Measurement must be

◊pre{◊code{
(and (string? m)
     (string=? m "high"))
}}
where the call to string? guards the call to string=?. This will protect string=? from ever receiving a number as an argument.
      }
    }
    ◊tr{
      ◊td{◊strong{Compound}
            ◊ul{
            ◊li{◊code{Position}}
            ◊li{◊code{Firework}}
            ◊li{◊code{Ball}}
            ◊li{◊code{cons}}
            ◊li{◊code{etc}}
            }
         }
      ◊td{
            ◊ul{
            ◊li{◊code{(posn? x)}}
            ◊li{◊code{(firework? x)}}
            ◊li{◊code{(ball? x)}}
            ◊li{◊code{(cons? x)}}
            ◊li{◊code{etc}}
            }
      }
      ◊td{
All selectors.
◊pre{◊code{
(... (posn-x x) (posn-y x))
(... (firework-y x) (firework-color x))
(... (ball-x x) (ball-dx x))
(... (first x) (rest x))
etc.
}}
Then consider the result type of each selector call and wrap the accessor expression appropriately using the table with that type. So for example, if after adding all the selectors you have:
◊pre{◊code{
(... (game-ball g) ;produces Ball
     (game-paddle g)) ;produces Paddle
}}
Then, because both Ball and Paddle are non-primitive types (types that you yourself defined in a data definition) the reference rule (immediately below) says that you should add calls to those types' template functions as follows:
◊pre{◊code{
(... (fn-for-ball (game-ball g))
     (fn-for-paddle (game-paddle g)))}}
      }
    }
    ◊tr{
      ◊td{◊strong{Other Non-Base Type Reference}}
      ◊td{Predicates come from: define-struct
      ◊ul{
        ◊li{◊code{(firework? x)}}
        ◊li{◊code{(person? x)}}
      }
      }
      ◊td{Call to other types template function
        ◊ul{
         ◊li{◊code{(fn-for-firework x)}} 
         ◊li{◊code{(fn-for-person x)}}}}
    }
    ◊tr{
      ◊td{◊strong{Self Reference}}
      ◊td{}
      ◊td{From natural recursion with call to this type's template function
        ◊code{(fn-for-ls (rest ls))}}
    }
    ◊tr{
      ◊td{◊strong{Mutal Reference}
      Note: form and group all templates in mutual reference cycle together}
      ◊td{}
      ◊td{Call to other type's template function:
      ◊code{(fn-for-lod (dir-subdirs d)}
      ◊code{(fn-for-dir (first lod))}}
    }
  }
}