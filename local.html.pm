#lang pollen

◊h1{Local}

◊h2{Formal Syntax Rules}
◊racket-code-block{
(local
  [<definitions>]
  <expression body>) ; MUST BE AN EXPRESSION, CANNOT BE A DEFINITION
}

Local has ◊code{<definitions>} that can ◊strong{only} be used in the ◊code{<expression body>} area.

For example:
◊racket-code-block{
(local
  [(define a 1)
   (define b 2)]
  (+ a b))
; produces 2

a
;^ error cause defintions inside a local are only valid inside the local body

(define (f x) 
    (+ x 1))
x
;^ error cause definitions inside a function are only valid inside the function
}

◊h2{Lexical Scoping}
Lexical scoping determines how variable names are resolved in nested functions or locals. A variable's scope is determined by its position in the source code at the time the code is written, not when it's executed. The scope is "fixed" lexically (by the physical structure of the code).

◊racket-code-block{
(define p "An")
(local
  [(define p "Bob")
   (define (greet n) (string-append n p))]
  (greet "hello "))
}
The racket language will go line by line, recording every variable it encounters and putting them into a box.
When it reaches a function or local block, it will wrap a box ◊strong{only in the area} of the function/local.
Here is the box diagram:
◊racket-code-block{
┌─────────────────────────────────────────────────┐
│;Global Scope                                    │
│                                                 │
│ (define p "An")                                 │
│                                                 │
│ ┌─────────────────────────────────────────────┐ │
│ │;Local Scope (inside local block)            │ │
│ │(local                                       │ │
│ │ [                                           │ │
│ │   (define p "Bob")                          │ │
│ │   (define (greet n)                         │ │
│ │ ┌─────────────────────────────────────────┐ │ │
│ │ │;Function Scope (greet)                  │ │ │
│ │ │   (string-append n p))                  │ │ │
│ │ └─────────────────────────────────────────┘ │ │
│ │ ]                                           │ │
│ │ (greet "hello "))                           │ │
│ └─────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────┘
}

Global scope records:
◊ul{
    ◊li{◊em{a variable} p bound "An"}
}

Local scope records:
◊ul{
    ◊li{◊em{a variable} p bound to "Bob"}
    ◊li{◊em{a function} greet
        ◊ul{
            ◊li{◊em{a local function variable} n}
        }
    }
}
We call functions at top level, the global scope, because it can be accessed by anyone, even those with very nested scopes!

In the case of the function ◊code{greet} scope, since it doesn't have ◊em{the variable} "p" in the paramter list, it looks it up and finds it in the local, but if it didn't exist in the local then it will then keep going until it hits the global. If no such variable exists, then you get an error.

◊h2{Evaluation Rules of Local}
◊ol{
    ◊li{Renaming}
    ◊li{Lifting to global/toplevel}
    ◊li{Replacing with renamed body}
    ◊li{Evaluate}
}
◊racket-code-block{
; STEP 0
(define b 6)
(+ b ; evalues to 6 in step1
   (local [(define b 2)]
     (* b b))
   b)

; STEP 1: Renaming: variables insidde local, b -> b_0
(define b 1)
(+ 6
   (local [(define b_0 2)]
     (* b_0 b_0))
   b)

; STEP 2: Lifting: Move b_0 to GLOBAL SCOPE
(define b_0 2)
(+ 6
   (local []
     (* b_0 b_0))
   b)

; STEP 3: Replace/remove the local with the renamed body
(+ 6
   (* b_0 b_0)
   b)

; STEP 4: Resolve variables and evalue 
(+ 6
    (* 2 2)
   6)

(+ 6 4 6) ; produces 16
}

Use the stepper over this expression.

◊h2{Benefits of Local}

◊h2{Clarifying readability}

◊racket-code-block{
; shipping-costv0 : (Number Number -> Number)
(define (shipping-costV0 weight distance)
  (+ 5 (* weight 0.5) (* distance 0.1)))
   ; ^ uh.. why are we adding 5? what is this?

; Clear version with named rates
; shipping-cost : (Number Number -> Number)
(define (shipping-cost weight distance)
  (local
    [(define base-shipping 5)
     (define cost-per-kg 0.5)
     (define cost-per-km 0.1)
     (define weight-cost (* weight cost-per-kg))
     (define distance-cost (* distance cost-per-km))
     (define total-cost (+ base-shipping weight-cost distance-cost))]
    total-cost))
}
The 2nd version is more clearer as to what we're calculating. This is a small example, but imagine a bigger function that uses distance-cost or weight-cost constantly! We would factor out a lot of repitition.

◊h2{Efficiency}
◊racket-code-block{
; largest-num : NonEmptyListOfNumber -> Number
; determines the largest number in the list
(check-expect (largest-num (list 2)) 2)
(check-expect (largest-num (list 7 4 6)) 7)
(check-expect (largest-num (list 1 9 3 2)) 9)
(define (largest-num lst)
  (cond
    [(empty? (rest lst))
     (first lst)]
    [else
     (if (> (first lst) (largest-num (rest lst)))
         (first lst)
         (largest-num (rest lst)))]))
}
You end up with quadratic blowup if you run it against this long list(biggest is 9):
◊code{(time (largest-num (list 7 0 4 0 3 0 4 5 7 5 2 1 7 8 1 4 8 3 6 2 9 0)))}
cpu time: 2403 real time: 2359 gc time: 212

2.4 seconds! This should not be happening!
This is because our code is making 2 recursive calls to "largest-num", so for a list of length.
◊strong{Each of those 2 recursive calls} computes it twice, leading to 4 recursive calls, and then those 4 will do 2 recursive calls each(4^2 = 16), 16^2

This is because to compute largest-num for the whole list, you need to compute it twice for the sublist of length n-1
And so on...

This creates a recursion tree where the number of function calls doubles at each level, leading to O(2^n) time complexity.
You can imagine this like your kids always having 2 kids
◊img[#:src "./images/exponential-fs8.png"]{}

◊h3{The Efficency fix}
Use local to store ◊code{(largest-num (rest lst))}
◊racket-code-block{
(define (largest-num lst)
  (cond
    [(empty? (rest lst))
     (first lst)]
    [else
     (local
       [(define larger-than-rest (largest-num (rest lst)))] ; STORE IT
       (if (> (first lst) larger-than-rest)
           (first lst)
           larger-than-rest))]))
}
Run ◊code{time} again and it should be super fast again!

This ◊a[#:href "https://www.desmos.com/calculator/vzgscor4h5"]{desmos graph models} the exponential blowup vs linear

◊h2{Encapsulation}

◊racket-code-block{
(define-struct point [x y])

; (: distance (Point Point -> Number))
; d = sqrt((x1-x0)^2 + (y1-y0)^2)
(define (distance p0 p1)
  (local
    [(define delta-x (- (point-x p1) (point-x p0)))
     (define delta-y (- (point-y p1) (point-y p0)))]
    (sqrt (+ (sqr delta-x) (sqr delta-y)))))

; (: slope (Point Point -> Point))
; calculates the change in x and y by doing: x1-x0 and y1-y0
(check-expect (slope (make-point 1 1) (make-point 2 3))
              (make-point 1 2))
(define (slope p0 p1)
  (local
    [(define delta-x (- (point-x p1) (point-x p0)))
     (define delta-y (- (point-y p1) (point-y p0)))]
    (make-point delta-x delta-y)))
}

The function ◊code{distance} and ◊code{slope} both internally have ◊code{delta-x} and ◊code{delta-y} variables, and the two don't run into naming collisions with each other.
The same can be said for local functions!

Sometimes helper functions are ◊strong{only} useful in the context of implementing a larger function, so therefore it should be put inside a local. Such as this example for 
◊code{calc-speed}
◊racket-code-block{
(define-struct plane [velocity altitude])
(define-struct vehicle [velocity tire-friction])

; (: plane-speed (Plane -> Number))
(define (plane-speed pln)
  (local
    [(define air-resistance 0.4)
     ; calc-speed : (Plane -> Number)
     (define (calc-speed pln) ; vehicle-speed also has its own version
       (* (plane-velocity pln) air-resistance (plane-altitude pln)))]
    (calc-speed pln)))

; (: vehicle-speed (Vehicle -> Number))
(define (vehicle-speed vhl)
  (local
    [(define traffic 0.9)
     ; calc-speed : (Vehicle -> Number)
     (define (calc-speed vhl) ; plane-speed also has its own version
       (* (vehicle-velocity vhl) traffic (vehicle-tire-friction vhl)))]
    (calc-speed vhl)))
}

Generally you want to limit the scope of unhelpful/specific functions so they don't pollute the global namespace. For useful functions, you want the scope to be wider so they can be discovered and reused when helpful.