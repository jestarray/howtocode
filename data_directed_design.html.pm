#lang pollen

◊h1{Data Directed Design}

◊h2{Where does recursion come from?}

It comes from the idea that the structure of the code should mirror the structure of the data definitions. Here we can see this done in some of the data definitions we've done before:

◊slide{
    ◊h2{Enum data}
    ◊img[#:src "images/dd_enum_arrows.png"]{}
}

◊slide{
    ◊h2{Union data}
    ◊img[#:src "images/dd_union_arrows.png"]{}
}

◊slide{
    ◊h2{Self Referential Data(Recursion)}
    ◊img[#:src "images/dd_selfref_arrows.png"]{}
    Trippy I know.
}

◊slide{
◊h2{The two main things you need to focus on are:}
    ◊ol{
        ◊li{◊h3{Base case: what we do when the list is ◊code{empty}, aka the termination condition}}
        ◊li{◊h3{How to contribute/combine to the base case} Focus on the 1 list long case and how you combine it with the base case to achieve the intended purpose, and trust that it will just work for a list of any length}
    }

◊h2{Self reference template}
◊racket-code-block{
; ListOfNumbers is one of:
; - empty
; - (cons Number ListOfNumber)
; interp. a list of numbers

; examples:
(define one-ls (cons 99 empty))
(define two-ls (cons 4 (cons 6 empty)))
(define three-ls (cons 1 (cons 8 (cons 5 empty))))

(define (list-of-nums-temp lst)
  (cond [(empty? lst) ...] ; ◄────── (1) ... base case
        [else
         (... (first lst)
              (list-temp (rest lst)))]))
        ; ▲
        ; │
        ; │
        ; (2) ... contribution to the base
    }
    Notice how the Data Definition maps to the code. It's a ◊code{one of}, so we need a ◊code{cond} with two matching cases. In the 2nd case, we simplify what would be ◊code{(cons? lst)} to ◊code{else} instead for short. ◊strong{Always use the derived template as starter code, as all recursive functions will have this structure.}
}

◊; emphasize an incremental approach, e.g looking at all the steps of the design recipe, e.g the examples, the sig, and dedeucing the contribution has to be a using functions that produce the output value. Read the docs otherwise to look for a combinator. Not to mention the base case has to be the type of the output function
◊; use the table method from iu 211 if youre stuck on finding the combinator
◊; trust the natural recursion, e.g trust the purpose statement, and that if it works for a 1 element long list(call it n?), it should work for n+1
◊; if you follow this structured approach, you see it all works out
◊slide{
◊h2{Recursion Exercise}
Use the design recipe and ◊strong{recursive template} to work through the following 3 problems
◊code{sum-price , count-items , has-peanuts?}

◊racket-code-block{
; ListOfNumber is one of:
; - empty
; - (cons Number ListOfNumber)
; interp. a sequence of numbers
; TODO: TEMPLATE

; sum-prices : (ListOfNumber -> Number)
; produces the sum total of the numbers in the given list

; count-items: (ListOfNumber -> Number)
; produces the amount of numbers in the given list

; ListOfString is one of:
; - empty
;- (cons String ListOfString)
; interp. a sequnce of strings 
; TODO: TEMPLATE

; has-peanuts? : (ListOfString -> Boolean)
; produces #true if the list contains "peanuts" 
}

◊details{◊summary{answer}
◊racket-code-block{
; Notice the similarities between 3 recursive functions

; ListOfNumber is one of:
; - empty
; - (cons Number ListOfNumber)
; interp. a sequence of numbers
(define (list-num-temp num-ls)
  (cond
    [(empty? num-ls) ...]
    [else
     (... (first num-ls)
          (list-num-temp (rest num-ls)))]))

; sum-prices : (ListOfNumber -> Number)
; produces the sum total of the numbers in the given list
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
; produces the amount of numbers in the given list
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
; - (cons String ListOfString)
; interp. a sequnce of strings
(define (list-string-temp str-ls)
  (cond
    [(empty? str-ls) ...]
    [else
     (... (first str-ls)
          (list-string-temp (rest str-ls)))]))

; has-peanuts? : (ListOfString -> Boolean)
; produces #true if the list contains "peanuts" 
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
}
}

◊slide{
◊h2{Similarities}
Here's a table in the main ways they are similar but differ:
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
            ◊td{◊code{(first nums)} the price itself}
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
}
Look in the ◊a[#:href "https://docs.racket-lang.org/htdp-langs/beginner.html"]{BSL documentation} for the combinator. If it doesn't exist, wishlist it!

I'm sure you're feeling:
◊strong{Wait a minute}, when I write the recrusive call, I'm ◊strong{assuming} this functions fullfills its purpose statement and just works? But I haven't even finished writing the function yet, in fact I'm still in the middle of writing it! It's weird... It feels like magic, like cheating! Not to mention purpose statements are just comments!

◊slide{
◊h2{How does it work?}
The individual/micro/mechanical operations of recursive functions expliots the rule that we've learned all the way in the start of the course, and that is that ◊strong{function operands}(aka parameters, inputs, arguments) ◊strong{need to be values} before the ◊strong{operator} can do its job. Let's explore this in a bit more detail!

Use the stepper and step through this expression:
◊racket-code-block{
    (+ (* 2 6 (/ 4 4)) (- 1 1))
}
This is the order of ◊strong{calls}:
Calling:
◊code{+} is ◊strong{called 1st}
◊code{*} is ◊strong{called 2nd}
◊code{/} is ◊strong{called 3rd}
◊code{-} is ◊strong{called last}

Even though ◊strong{+} is called first, it has to wait until all of its operands resolve into values, so it is executed last. The order of the operations that ◊strong{executes} is different:

Executing:
◊code{/} is ◊strong{executed 1st}
◊code{*} is ◊strong{executed 2nd}
◊code{-} is ◊strong{executed 3rd}
◊code{+} is ◊strong{executed last}
}

◊slide{
Note that ◊em{calling and executing are two different things}. 
◊strong{Calling} a function is like putting it on a todolist.
◊strong{Executing} a function is doing the operation.
}
As a function calls itself, it will build a sort of "chain" of calls until it hits and stops at the base case. Let's see this in action using the stepper to step through the call to:
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

◊slide{
◊h2{Table method}
It is often better to write out the execution in a ◊a[#:href "https://samagino.github.io/Beginning-Student-Tables/"]{table format} for more of a birds eye view. Here is the execution of ◊code{sum-prices} when it is given the list ◊code{(cons 2 (cons 1 (cons 7 empty)))}:

◊table{
    ◊thead{
        ◊th{step#}
        ◊th{lst}
        ◊th{(empty? lst)}
        ◊th{(first lst)}
        ◊th{(rest lst)}
    }
    ◊tbody{
        ◊tr{
            ◊td{1}
            ◊td{◊code{(cons 2 (cons 1 (cons 7 empty)))}}
            ◊td{◊code{false}}
            ◊td{◊code{2}}
            ◊td{◊code{(cons 1 (cons 7 empty))}}
        }
        ◊tr{
            ◊td{2}
            ◊td{◊code{(cons 1 (cons 7 empty))}}
            ◊td{◊code{false}}
            ◊td{◊code{1}}
            ◊td{◊code{(cons 7 empty)}}
        }
        ◊tr{
            ◊td{3}
            ◊td{◊code{(cons 7 empty)}}
            ◊td{◊code{false}}
            ◊td{◊code{7}}
            ◊td{◊code{empty}}
        }
        ◊tr{
            ◊td{4}
            ◊td{◊code{empty} ◊mark{base case: ◊code{0}}}
            ◊td{◊code{true}}
            ◊td{ERROR}
            ◊td{ERROR}
        }
    }
    ◊caption{
       ◊code{(+ 2 (+ 1 (+ 7 0)))}
       ◊p{Note that the base case produces: ◊code{0}}
    }
}
Notice that the list gets smaller on each iteration step
}

◊slide{
◊h2{Top mistakes students make when doing recursion}
◊ol{
    ◊li{◊a[#:href "https://youtu.be/Ae7g73jM4J4?feature=shared&t=733"]{Being hung up on the individual mechanical operations of each recursive call}}
    ◊li{Not writing or using a template as a starter}
    ◊li{Not using the stepper/writing things down in a table}
    ◊li{Not having a ◊strong{clear} purpose statement and trusting it, and focusing too much on the code. Purpose statements should focus on ◊strong{what} the function computes not ◊strong{how} it goes about it}
    ◊li{Forgetting to make sure the a recursive function calls itself}
    ◊li{Not having a good base case}
    ◊li{Not having the functions follow the signature}
}
}

◊slide{
◊h2{Debugging recursive functions}
◊ol{
    ◊li{Comment out all tests ◊strong{except the failing one}, and use the stepper}
    ◊li{Write out in a table the first and rest of every call to get a birds eyeview: ◊a[#:href "https://samagino.github.io/Beginning-Student-Tables/"]{beginning student tables}}
}
}

◊slide{
◊h2{Why is recursion hard?}
◊h3{1. Default mindset: Humans think sequentially ("do A, then B, then C").}

Recursion demands: "Solve a smaller version of the problem first, then combine results"—a backwards or self-referential logic.

Example:

Iterative: "To climb 10 stairs, step 1, then 2, then 3..."

Recursive: "To climb 10 stairs, first know how to climb 9 stairs, then add one more step."

Why it feels unnatural: Recursion asks us to delegate the work before seeing the result, which feels like "cheating", compared to the iteration where we can see all the previous steps before us more easily.

◊h3{2. The Fear of the Unknown}
Desire for control: People want to trace every call to feel "sure" it works.

Recursion's opacity: Each recursive call hides complexity, creating unease.

◊h3{3. Infinite Loop Anxiety}
Base-case paranoia: Missing or incorrect base cases lead to infinite recursion (and stack overflows). In contrast to iteration, we have a more intuitive grasp at when we end up front with very little chances of infinite looping.

The idea of why recursion works is similar to proofs by ◊a[#:href "https://youtu.be/x5cWX-EyLEI"]{mathematical induction}.
}
