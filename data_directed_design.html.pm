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
    ◊h2{Self Referential Data(Recursion)}
    ◊img[#:src "images/dd_selfref_arrows.png"]{}

    ◊h2{Self reference template}
    ◊racket-code-block{
; ListOfNumbers is one of:
; - empty
; - (cons Number ListOfNumber)
; interp. a list of numbers

; examples:
(define nothing empty)
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
    Notice how the Data Definition maps to the code. It's a ◊code{one of}, so we need a ◊code{cond} with two matching cases. In the 2nd case, we use ◊code{else} for short. ◊strong{Always use the derived template as starter code, as all recursive functions will have this structure.}
}

◊slide{
◊h2{The two main things you need to focus on is:}
    ◊ol{
        ◊li{◊h3{Base case: what we do when the list is empty, aka the termination condition}}
        ◊li{◊h3{How to contribute/combine to the base case} Focus on the 1 list long case and how you combine it with the base case to achieve the intended purpose, and trust that it will just work for a list of any length}
    }
}

◊; emphasize an incremental approach, e.g looking at all the steps of the design recipe, e.g the examples, the sig, and dedeucing the contribution has to be a using functions that produce the output value. Read the docs otherwise to look for a combinator. Not to mention the base case has to be the type of the output function
◊; use the table method from iu 211 if youre stuck on finding the combinator
◊; EMPHASIZE IU 211 TABLE METHOD
◊; trust the natural recursion, e.g trust the purpose statement, and that if it works for a 1 element long list(call it n?), it should work for n+1
◊; if you follow this structured approach, you see it all works out
◊; #1 mistake is not continuing the recursion, which if you work off of the list template, won't happen
◊slide{
Use the design recipe and ◊strong{recursive template} to work through the following 3 problems
◊code{sum-prices count-items has-peanuts?}

◊racket-code-block{
; ListOfNumber is one of:
; - empty
;- (cons Number ListOfNumber)
; interp. a sequence of numbers

(define (list-num-temp num-ls)
  (cond
    [(empty? num-ls) ...]
    [else
     (... (first num-ls)
          (list-num-temp (rest num-ls)))]))

; sum-prices : (ListOfNumber -> Number)
; produces the combined sum total of all the numbers in the given list

; count-items: (ListOfNumber -> Number)
; produces the COUNT of how many numbers are in the list

; ListOfString is one of:
; - empty
;- (cons String ListOfString)
; interp. a sequnce of strings 
(define (list-string-temp str-ls)
  (cond
    [(empty? str-ls) ...]
    [else
     (... (first str-ls)
          (list-string-temp (rest str-ls)))]))

; has-peanuts? : (ListOfString -> Boolean)
; produces #true if the list contains "peanuts" 
}

◊details{◊summary{answer}
◊racket-code-block{
; Notice the similarities between 3 recursive functions

; ListOfNumber is one of:
; - empty
;- (cons Number ListOfNumber)
; interp. a sequence of numbers

; sum-prices : (ListOfNumber -> Number)
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
;- (cons String ListOfString)
; interp. a sequnce of strings 

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
}
I'm sure you're feeling:
◊strong{Wait a minute}, when I write the recrusive call, I'm ◊strong{assuming} this functions fullfills its purpose statement and just works? But I haven't even finished writing the function yet! I'm still in the process of writing it out, and I don't know why this works. It feels like magic, like cheating! Not to mention purpose statements are just comments!
◊; Table method: https://samagino.github.io/Beginning-Student-Tables/

◊slide{
◊h2{How does it work?}
The individual/micro operations of recursive functions expliots the rule that we've learned all the way in the start of the course, and that is that ◊strong{function operands}(aka parameters, inputs, arguments) ◊strong{need to be values} before the ◊strong{operator} can do its job. Let's explore this in a bit more detail!

Use the stepper and step through this expression:
◊racket-code-block{
    (+ (* 2 6  (/ 4 4)) (- 1 1))
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

As a function calls itself, it will build a sort of "chain" of calls until it hits the base case. Let's see this in action using the stepper to step through the call to:
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
◊h2{Top mistakes students make when doing recursion}
◊ol{
    ◊li{◊a[#:href "https://youtu.be/Ae7g73jM4J4?feature=shared&t=733"]{Being overly concerned/hung up on the individual micro operations of recursive functions}}
    ◊li{Not having a good base case}
    ◊li{Forgetting to write the natural recursion on the rest of the list in the fucntion}
    ◊li{Not following the signature}
    ◊li{Not having a ◊strong{clear} purpose statement and trusting it, and focusing too much on the code}
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
