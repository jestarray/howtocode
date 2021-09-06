#lang pollen

◊h1{Common errors}

Mismatching parens, use logic, it's always (operator, arg1)

The operator will always always come first.

(+ (4) 7)

(4) ERROR: is an error because 4 is not an operator


Enable automatic parens but be warned sometimes it will insert 2 when you really just want one, but its most often the case you always want 2 auto-closed, same with quotes

It's the default setting for vscode

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

tradeoffs! you can say you hate this but the language was designed this way for a purpose, see my first videos links if you're curious as to why parentehsis etc