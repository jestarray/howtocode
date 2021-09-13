#lang pollen

◊h1{Wrapping Errors}

◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket" 
"(<operator> <argument-1> <argument-2> ...)
; example:
(+ (+ (- 4  1) 7) 9)
")
}

COUNT THE PARTS TO IFS, ETC

After an open parenthesis ◊code{"("} ◊strong{an operator must always follow after}, such as +, etc.
Even in this expression, ◊code{(+ 2 (+ 6 4))} the argument ◊code{(+ 6 4)} follows the exact same structure, and its turtles all the way down.

(+ (+ (- 4  1) 7) 9)

(4) ERROR: is an error because 4 is not an operator


Enable automatic parens but be warned sometimes it will insert 2 when you really just want one, but its most often the case you always want 2 auto-closed, same with quotes

It's the default setting for vscode and many other text editors, and it's a good default because the common case is that its more beneficial to

if you delete the starting parens, look to delete the ending one.

some students keep randomly wrapping parenthesis when things dont work and I want to emphasize that you should use logic to wrap parens.

Everything has to follow <operator arg1 arg2> (+ 1 2) and if you need to do more you have to come back out and wrap around... which is a bit counter intutive because we like to keep adding things at the end


Notice the language is a little kind of counter intutive because we have to go back left, wrap around parens, and add stuff, e.g
4 + 5 * 3 + 2 - 1 , we can just keep adding stuff to the right but we have to implcity remember PEMDAS, multiplcation happens first

when you naturally type this out in racket it feels a little weird and grooky
in racket
(* 5 3) ; write this first, then go back left and wrap thoose around parens
kind of weird since the lot of us are right handed and prefer just tacking things onto the right
(+ 4 (* 5 3) (- 2 1)) 

todo: explain error messages like if expects 3 parts, etc. BSL tries to be very error message friendly. Sometimes error messages are misleading and that's when you need to look past the error message and find the source.

TODO: fix a lot of exercises that have buggy parenthesis, 5-10

tradeoffs! you can say you hate this but the language was designed this way for a purpose, see my first videos links if you're curious as to why parentehsis etc