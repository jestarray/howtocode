#lang pollen
◊h1{Functions}

Functions consume and produce values. You've been ◊strong{using} functions all along!
A few are: 
◊code{string-append} that consumes 2 strings and produces them together
◊code{rectangle} that consumes 2 numbers and 2 strings and produces an image
◊code{sqrt} that consumes 1 number and produces another number
◊code{+} to add an arbitrary amount of numbers.

but we can create our own functions.

◊h2{How to create a function?}
◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"; creating a function
;the function name and the argument names can be whatever you want, just has to be matching in the body
(define (<f-name> <arg1>...)
    <body>) ; where every instance of the named args are replaced in the body.
")
}

◊h2{How are functions useful?}

In the previous section on variables, we went over how you can make your program more readable and maintable by storing constant data in variables, but sometimes that still isn't enough because you'd end up with way too many variables. Functions let us take it a step further by factoring out varying variables/data. Let's look back to our image exercises.

If I were to ask you to make 10 stop signs, of varying size, 30, 60, 90, increasing by 30 every time etc, it'd be a huge hastle to keep track of lot of variable names

◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"; creating a function
(require 2htdp/image)

(define stop1-hexsize 30)
(overlay
 (text \"STOP\" (- stop1-hexsize 5) \"white\")
 (regular-polygon stop1-hexsize 8 \"solid\" \"red\"))

(define stop2-hexsize 60)
(overlay
 (text \"STOP\" (- stop2-hexsize 5) \"white\")
 (regular-polygon stop2-hexsize 8 \"solid\" \"red\"))

(define stop3-hexsize 90)
(overlay
 (text \"STOP\" (- stop3-hexsize 5) \"white\")
 (regular-polygon stop3-hexsize 8 \"solid\" \"red\"))
; ... I can do more but i think you get the point
")
}

We can instead create a function that will create the variable in a local temporary environment to vary the size of the stop sign for us, and have the code read like its creating a stop sign
◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"; name of the function is stop-sign
; size is a parameter that we named arbitrarily

(define (stop-sign size)
    (overlay
        (text \"STOP\" (- size 5) \"white\")
        (regular-polygon size 8 \"solid\" \"red\")))

; no more needing to create variables
; and copy and pasting overlay, text, and regular polygon 
(stop-sign 30) ; all in 1 line to create a stop-sign
(stop-sign 60)
(stop-sign 90)
")
}

◊h2{Exercise 2: Create a hexagon function}

You may notice that 2htdp doesn't contain a hexagon function. It's a lot of tedious typing for all the parameters, e.g solid & red.

◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"(define size1 30)
(define size2 90)
; all these parameters to create a red hexagon. 
; Also unclear what this does to a stranger until they run the code or read docs
(regular-polygon size1 8 \"solid\" \"red\")
(regular-polygon size2 8 \"solid\" \"red\") ; copy & paste and change the size every time")
}

◊(define problem-files (starter-solution "2-redhex"))
◊(define starter (car problem-files))
◊(define solution (cadr problem-files))

◊pre[#:class "line-numbers match-braces rainbow-braces" #:data-src ◊(car starter) #:data-download-link ""]{
    ◊(code #:class "language-racket" ◊(cadr starter))
}

◊details{
    ◊summary{Answer}
◊pre[#:class "line-numbers match-braces rainbow-braces" #:data-src ◊(car solution)]{
    ◊(code #:class "language-racket" ◊(cadr solution))
}
}

◊h2{Exercise 2.1: Create a trapezoid function}
◊(define problem-trap (starter-solution "2.1-isotrapezoid"))
◊(define starter-trap (car problem-trap))
◊(define solution-trap (cadr problem-trap))

◊pre[#:class "line-numbers match-braces rainbow-braces" #:data-src ◊(car starter-trap) #:data-download-link ""]{
    ◊(code #:class "language-racket" ◊(cadr starter-trap))
}

◊details{
    ◊summary{Answer}
◊pre[#:class "line-numbers match-braces rainbow-braces" #:data-src ◊(car solution-trap)]{
    ◊(code #:class "language-racket" ◊(cadr solution-trap))
}
}

◊h2{Exercise 2.2: Create a checkerboard function}
◊(define problem-checker (starter-solution "2.2-checkerboard"))
◊(define starter-checker (car problem-checker))
◊(define solution-check (cadr problem-checker))

◊pre[#:class "line-numbers match-braces rainbow-braces" #:data-src ◊(car starter-checker) #:data-download-link ""]{
    ◊(code #:class "language-racket" ◊(cadr starter-checker))
}

◊details{
    ◊summary{Answer}
◊pre[#:class "line-numbers match-braces rainbow-braces" #:data-src ◊(car solution-check)]{
    ◊(code #:class "language-racket" ◊(cadr solution-check))
}
}

◊h2{Conclusion}
Functions allow us to ◊strong{re-use} and combine a set of operations which factors out duplication making our code more shorter, readable and understandable, similar to how reapted addition on whole numbers like 5 + 5 + 5 + 5 can be re-written more consisely as 5 * 4.

You can use Check-Syntax or the stepper to see this in action to see variable susbtitution for functions in action.

◊; todo: which one of the following function calls evaluates to <NUMBER>, where the func is random addition and subtraction, also have "error" as an answer.