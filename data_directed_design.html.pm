#lang pollen

◊h1{Data Directed Design}

The structure of the code should mirror the structure of the data definitions. Here we can see this done in some of the data definitions we've done before:

◊slide{
    ◊h2{Enum data}
    ◊img[#:src "images/dd_enum_arrows.png"]{}
}

◊slide{
    ◊h2{Union data}
    ◊img[#:src "images/dd_union_arrows.png"]{}
}

◊slide{
    ◊h2{Self Referential Data}
    ◊img[#:src "images/dd_selfref_arrows.png"]{}

    ◊h2{Self reference template}
    ◊racket-code-block{
        (define (list-temp lst)
            (cond [(empty? lst) ...] ; ◄────── (1) ... base case
                  [else
                     (... (first lst)
                          (list-temp (rest lst)))]))
                     ; ▲
                     ; │
                     ; │
                     ; (2) ... contribution to the base

    }
    Notice the ◊code{...} in the template for ◊code{ListOfString} mirrors that of the data definition. ◊strong{Always use the template as starter code.} The two main things you need to focus on is:
    ◊ol{
        ◊li{Base case: what we do when the list is empty, the termination condition}
        ◊li{How to contribute/combine to the base case}
    }
}

◊; emphasize an incremental approach, e.g looking at all the steps of the design recipe, e.g the examples, the sig, and dedeucing the contribution has to be a using functions that produce the output value. Read the docs otherwise to look for a combinator. Not to mention the base case has to be the type of the output function
◊; use the table method from iu 211 if youre stuck on finding the combinator
◊; EMPHASIZE IU 211 TABLE METHOD
◊; trust the natural recursion, e.g trust the purpose statement, and that if it works for a 1 element long list(call it n?), it should work for n+1
◊; if you follow this structured approach, you see it all works out
Consider the following 3 recursive functions:
◊code{sum-prices count-items has-peanuts?}

◊racket-code-block{
; Notice the similarities between 3 recursive functions

; ListOfNumber is one of:
; - empty
;- (cons Number ListOfNumber)
; interp. a sequence of numbers

; sum-prices (ListOfNumber -> Number)
; produces the combined sum total of all the numbers in the given list
(check-expect (sum-prices empty) 0)
(check-expect (sum-prices (cons 0.50 (cons 4 empty))) (+ 4 0.50))
(check-expect (sum-prices (cons 2 (cons 1 (cons 7 empty)))) (+ 2 1 7))
(define (sum-prices num-lst)
  (cond
    [(empty? num-lst) 0]
    [else
     (+  (first num-lst)
         (sum-prices (rest num-lst)))]))

; count-items: (ListOfNumber -> Number)
; produces the COUNT of how many numbers are in the list
(check-expect (count-items empty) 0)
(check-expect (count-items (cons 33 (cons 4 empty))) 2)
(define (count-items num-lst)
  (cond
    [(empty? num-lst) 0]
    [else
     (+ 1
        (count-items (rest num-lst)))]))

; ListOfString is one of:
; - empty
;- (cons Number ListOfString)
; interp. a sequnce of strings 

; has-peanuts?: (ListOfString -> Boolean)
; produces #true if the list contains "chocolate" 
(check-expect (has-peanuts? empty) #false)
(check-expect (has-peanuts? (cons "vanilla" (cons "chocolate" empty))) #true)
(check-expect (has-peanuts? (cons "mint" (cons "peanuts" empty))) #true)
(define (has-peanuts? str-lst)
  (cond
    [(empty? str-lst) #false]
    [else
     (if (string=? (first str-lst) "peanuts")
         #true
         (has-peanuts? (rest str-lst)))]))
}
Here is a table in the main ways they differ:
◊table{
    ◊thead{
        ◊th{Function}
        ◊th{Base}
        ◊th{Contribution of first}
        ◊th{Combination}
    }
    ◊tbody{
        ◊tr{
            ◊td{◊code{has-peanuts?}}
            ◊td{◊code{false}}
            ◊td{◊code{(string=? (first str-lst) "peanuts")}}
            ◊td{◊code{(if <condition> #true <recurse>)}}
        }
        ◊tr{
            ◊td{◊code{sum-prices}}
            ◊td{◊code{0}}
            ◊td{the price itself(first nums)}
            ◊td{◊code{+}}
        }
        ◊tr{
            ◊td{◊code{count-items}}
            ◊td{◊code{0}}
            ◊td{1}
            ◊td{◊code{+}}
        }
    }
}

Recursion is difficult, its like reciting the alphabet backwards... not as natural to how we think.

I'm sure you're feeling:
Wait a minute, I'm ◊strong{assuming} this functions fulfills its purpose statement but I haven't even finished the function itself yet! I'm still the process of writing it out, and I don't know why this works. It feels like magic, like cheating!

With iteration, its "What's the next operation? Do the next operation NOW", and we see the state changes happen way earlier.
With recursion, its "Do the next operation, not NOW but after we've done all the other operations to get to the last one" and we dont see state changing until it comes all the way back up and combines together 
https://youtu.be/x5cWX-EyLEI mathematical induction


◊h2{How does it work?}
There's an intense urge to ◊strong{need to know} all the individual/micro steps of a recursive function, BUT this is not how you should think about solving recursive problems. You'll inevitably do it so we'll go over it together ◊strong{once}. I ◊strong{highly recommended} that you use the stepper to to do this! As a function calls itself, it will build a sort of "chain" of calls until it hits the base case. Let's see this in action with a call to:
◊code{(sum-prices (cons 2 (cons 1 (cons 7 empty))))}

◊racket-code-block{
 (+
  2
  (+
   1
   (+
    7
    (cond
     [(empty? '()) 0] ; <- the base case
     [else
      (+ (first '()) (sum-prices (rest '())))]))))

; hitting the base case:
 (+
  2
  (+
   1
   (+
    7
    (cond
     [#true 0] ; <- the base case
     [else
      (+ (first '()) (sum-prices (rest '())))]))))

; the "final" expression, a chain of calls:
 (+
  2
  (+
   1
   (+
    7
     0))) ; <- the base case
; ^ re-written more neatly without the spacing:
(+ 2 (+ 1 (+ 7 0)))
}

For debugging purposes, thinking about the micro steps too much is not helpful.

◊h2{Why is recursion hard?}
◊h3{1. Default mindset: Humans think sequentially ("do A, then B, then C").}

Recursion demands: "Solve a smaller version of the problem first, then combine results"—a backwards or self-referential logic.

Example:

Iterative: "To climb 10 stairs, step 1, then 2, then 3..."

Recursive: "To climb 10 stairs, first know how to climb 9 stairs, then add one more step."

Why it feels unnatural: Recursion asks us to delegate the work before seeing the result, which feels like "cheating", compared to the iteration where we can see all the previous steps before us more easily.

◊h3{2. The Fear of the Unknown}
Desire for control: People want to trace every call to feel "sure" it works.

Recursion’s opacity: Each recursive call hides complexity, creating unease.

◊h3{3. Infinite Loop Anxiety}
Base-case paranoia: Missing or incorrect base cases lead to infinite recursion (and stack overflows). In contrast to iteration, we have a more intuitive grasp at when we end up front with very little chances of infinite looping.

This is ◊strong{NOT} how you should approach recursive functions, and here's why:
- 12:38 to 13:30 recursive functions mental stack blowup(norman ramsay on teaching htdp)
    - we want to know the micro operations but that is not where the focus should really be in recursion?

Eventually you'll develop an intution of trust
- EMPHASIZE that you only need to focus on the base case, and filling in the ... of the template
- EMPHASIZE IU 211 TABLE METHOD

- look up how cs2500, iu211, uwaterloo, brown?? and how they teach recursion first,