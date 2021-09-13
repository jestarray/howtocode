#lang pollen
◊h1{Functions}

Functions consume and produce values. You've been ◊strong{using} functions all along!
A few are: 
◊code{string-append} that consumes 2 strings and produces them together
◊code{rectangle} that consumes 2 numbers and strings and produces an image
◊code{sqrt} that consumes 1 number and produces another number

but we can create our own functions.

◊h2{How to create a function?}
◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"; creating a function
(define (<f-name> <arg1>...)
    <body>) ; where every instance of the named args are replaced in the body.
")
}

◊h2{What are functions for?}

In the previous section on variables, we went over how you can make your program more maintable by storing constant data in variables, but sometimes that still isn't enough because you'd end up with way too many variables. Functions let us take it a step further, Let's look back to our image exercises. 

You may notice that 2htdp doesn't contain a hexagon function. It's a lot of tedious typing for all the parameters, e.g solid & red

◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"(define size1 30)
(define size2 90)
; all these parameters to create a red hexagon. 
; Also unclear what this does to a stranger until they run the code
(regular-polygon size1 8 \"solid\" \"red\")
(regular-polygon size2 8 \"solid\" \"red\") ; copy & paste and change the size every time

; if we make a function instead, we can give it a meaningful name and vary the value
(define (red-hexagon size)
; body will replace all instances of size with what we pass in
    (regular-polygon size 8 \"solid\" \"red\")) 

; we can create red hexagons without needing to type solid red
; the argument, aka parameter/operand makes it easy to vary the size
; we can also understand immediately what this will create
(red-hexagon 30)
(red-hexagon 60)
(red-hexagon 90)
")
}

Functions factor out even more redudant duplication making our code shorter and more understandable, similar to reapted addition on whole numbers like 5 + 5 + 5 + 5 can be re-written more consisely as 5 * 4 .

If I were to ask you to make 10 stop signs, of varying size, 30, 60, 90, etc, it'd be a huge hastle to keep track of lot of variable names

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

We can instead create a function that will vary the size of the stop sign for us, and have the code read like its creating a stop sign
◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"; creating a function for stopsigns
(define (stop-sign size)
    (overlay
        (text \"STOP\" (- size 5) \"white\")
        (regular-polygon size 8 \"solid\" \"red\")))

(stop-sign 30)
(stop-sign 60)
(stop-sign 90)
")
}
You can use Check-Syntax or the stepper to see this in action

Take this example where there are way too many changing values: 

◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"; npc merchant dialogue or some store reward member discount
\"Hi Bob, since I've known you for 1 years, I will slice the original price of 100 coins to 75\"
\"Hi Anna, since I've known you for 2 years, I will slice the original price of 100 coins to 50\"
\"Hi Steve, since I've known you for 3 years, I will slice the original price of 100 coins to 25\"
\"Hi Amanda, since you known you for 4 years, I will slice the original price of 100 coins to 0\"
; the name, the quest number, the price are the changing values, each decreasing by 25% per year
")
}

For every username you would have to type out this string when we can factor only the parts that need to change into a function, namely the username

Exercise: turn the Pythagorean theorm in exercise 0 turned into a function
Exercise: trapezoid into a function