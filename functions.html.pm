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

(define stop1-octsize 30)
(overlay
 (text \"STOP\" (- stop1-octsize 5) \"white\")
 (regular-polygon stop1-octsize 8 \"solid\" \"red\"))

(define stop2-octsize 60)
(overlay
 (text \"STOP\" (- stop2-octsize 5) \"white\")
 (regular-polygon stop2-octsize 8 \"solid\" \"red\"))

(define stop3-octsize 90)
(overlay
 (text \"STOP\" (- stop3-octsize 5) \"white\")
 (regular-polygon stop3-octsize 8 \"solid\" \"red\"))
; ... I can do more but i think you get the point
")
}

We can instead create a function that will create the variable in a local temporary environment to vary the size of the stop sign for us, and have the code read like its creating a stop sign
◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"; name of the function is stop-sign
; size is a parameter that we named arbitrarily
; 1: encapsulates a set of operations
(define (stop-sign size)
    (overlay
        (text \"STOP\" (- size 5) \"white\")
        (regular-polygon size 8 \"solid\" \"red\")))

; no more needing to create variables
; and copy and pasting overlay, text, and regular polygon 
; 2: much more meaningful name, stop-sign
(stop-sign 30) ; all in 1 line to create a stop-sign
(stop-sign 60)
(stop-sign 90)
; 3: reduced a lot of repition compared to example above
")
}

◊h2{Exercise 2 Create an octogon function}

You may notice that 2htdp/image doesn't contain an octogon function built in. It's a lot of tedious typing for all the parameters, e.g solid & red.

◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"(define size1 30)
(define size2 90)
; all these parameters to create an red octogon. 
; Also unclear what this does to a stranger until they run the code or read docs
(regular-polygon size1 8 \"solid\" \"red\")
(regular-polygon size2 8 \"solid\" \"red\") ; copy & paste and change the size every time")
}

◊(define problem-files (starter-solution "2-redocto"))
◊(define starter (car problem-files))
◊(define solution (cadr problem-files))

◊pre[#:class "line-numbers match-braces rainbow-braces" #:data-src ◊(car starter) #:data-download-link ""]{
    ◊(code #:class "language-racket" ◊(cadr starter))
}

◊details{
    ◊summary{Answer}
◊pre[#:class "line-numbers match-braces rainbow-braces" #:data-src ◊(car solution) #:data-download-link ""]{
    ◊(code #:class "language-racket" ◊(cadr solution))
}
}

◊h2{Exercise 2.1 Create a warning sign function}

◊(define problem-warn (starter-solution "2.1-warning"))
◊(define starter-warn (car problem-warn))
◊(define solution-warn (cadr problem-warn))

◊pre[#:class "line-numbers match-braces rainbow-braces" #:data-src ◊(car starter-warn) #:data-download-link ""]{
    ◊(code #:class "language-racket" ◊(cadr starter-warn))
}

◊details{
    ◊summary{Answer}
◊pre[#:class "line-numbers match-braces rainbow-braces" #:data-src ◊(car solution-warn) #:data-download-link ""]{
    ◊(code #:class "language-racket" ◊(cadr solution-warn))
}
}

◊h2{Exercise 2.2 Create a trapezoid function}
◊(define problem-trap (starter-solution "2.2-isotrapezoid"))
◊(define starter-trap (car problem-trap))
◊(define solution-trap (cadr problem-trap))

◊pre[#:class "line-numbers match-braces rainbow-braces" #:data-src ◊(car starter-trap) #:data-download-link ""]{
    ◊(code #:class "language-racket" ◊(cadr starter-trap))
}

◊details{
    ◊summary{Answer}
◊pre[#:class "line-numbers match-braces rainbow-braces" #:data-src ◊(car solution-trap) #:data-download-link ""]{
    ◊(code #:class "language-racket" ◊(cadr solution-trap))
}
}

◊h2{Exercise 2.3 Create a checkerboard function}
◊(define problem-checker (starter-solution "2.3-checkerboard"))
◊(define starter-checker (car problem-checker))
◊(define solution-check (cadr problem-checker))

◊pre[#:class "line-numbers match-braces rainbow-braces" #:data-src ◊(car starter-checker) #:data-download-link ""]{
    ◊(code #:class "language-racket" ◊(cadr starter-checker))
}

◊details{
    ◊summary{Answer}
◊pre[#:class "line-numbers match-braces rainbow-braces" #:data-src ◊(car solution-check) #:data-download-link ""]{
    ◊(code #:class "language-racket" ◊(cadr solution-check))
}
}

◊h2{Evaluation and Scope}

A function will look for variables ◊em{inside} of itself first, and only if it can't find it, will it keep looking up until it hits the global scope, and if it still can't find it after that then it will be an error.

◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"(define z 8)
(define t 6)
(define v 7)

(define (p k v) (- z 2 v 9 7))
; there are two v's BUT v will be 4, NOT 7
; and z will be 8
(p 3 4)  ; evaluates to -14
; NOT -17, had v been 7
")
}

A function can access global variables but the global context cannot access variables within a function. What happens inside a function stays inside a function.

◊img[#:src "images/scope_tower.png"]{}

You can think of it as looking for your lost kid in a huge multi-floor building. You're going to start at the first floor and then if you can't find them, you go up to floor 2, and then look around, then up and up until you hit the final floor.

◊h2{Practice Function Eval and Scope}

◊a[#:href "https://jestlearn.com/how_to_code/#function_evaluation_and_scope_1"]{Practice Function Eval and Scope 1}

◊a[#:href "https://jestlearn.com/how_to_code/#function_evaluation_and_scope_2_nested"]{Practice Function Eval and Scope 2}

Get used to looking around and resolving what variables to values.

◊h2{Conclusion}
Functions allow us to ◊strong{re-use} and:

◊ol{
    ◊li{combine a set of operations}
    ◊li{give a meaningful name to the combined operations}
    ◊li{factor out and reduce duplication}
}

thus making our code more shorter, maintainable, and readable, a little similar to how reapted addition on whole numbers like 5 + 5 + 5 + 5 can be re-written more consisely as 5 * 4.

You can use Check-Syntax or the stepper to see this in action to see variable susbtitution for functions in action.

◊h2{Videos}

◊a[#:href "https://www.youtube.com/watch?v=OUx0gzniKg8&list=PLitFP8FdScfE5nwRovCwdhhW9RTx98q3J&index=15"]{Functions Video}

◊a[#:href "https://www.youtube.com/watch?v=aMtjB_OChxM&list=PLitFP8FdScfE5nwRovCwdhhW9RTx98q3J&index=16"]{Function Exercies Video}