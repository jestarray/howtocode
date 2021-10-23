#lang pollen

◊h1{Templates and Outlines}

Templates, or as I'd like to call them, "outlines", is the bare minimum baseline to kickstart writing a function. It's akin to laying out all your tools neatly before picking which one to use, or like an artist drawing a rough outline/sketch as a baseline. If you've tried visual block based languages like ◊a[#:href "https://scratch.mit.edu/"]{Scratch}, it lays out all the blocks for you that you can use, and this is what tempaltes accomplish, to gather all the puzzle pieces we can use, as the alternative is staring at a blank page stunned. As you program more and more, you'll be able to template problems in your head.

◊; TypeOf , instead of "atomic non-distinct" ,general, broad

◊;  InstanceOf , instead of "atomic distinct", specific, narrow

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
    [... st ...))

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