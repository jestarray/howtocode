#lang pollen

◊h1{Trees}

◊h2{Binary Trees}

◊h2{Mutual Recursion}
◊racket-code-block{
(define (is-even n)
  (if (= n 0)
      #true
      (is-odd (- n 1))))

(define (is-odd n)
  (if (= n 0)
      #false
      (is-even (- n 1))))

(is-even 4) ; call
; is_odd n=3
; is_even n=2
; is_odd n=1
; is_even n=0 ;base case produce #true and bubbles back up ^
}

◊img[#:src "./images/is_even_stack.svg"]{}

Mutual Recursion mechanically speaking, is when functions call each other in a cycle. 
You can visualize this with ◊a[#:href "https://pythontutor.com/render.html#code=def%20is_even%28n%29%3A%0A%20%20%20%20if%20n%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20True%0A%20%20%20%20return%20is_odd%28n%20-%201%29%0A%0Adef%20is_odd%28n%29%3A%0A%20%20%20%20if%20n%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20False%0A%20%20%20%20return%20is_even%28n%20-%201%29%0A%0A%0Ais_even%284%29&cumulative=false&curInstr=0&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"]{pythontutor} translated into python


◊h2{Backtracking}
When we write functions over Trees, they "backtrack". We don't explicity write code that tells the function to backtrack, it just so happens that it's how the code executes because of how function work at a mechanical level.

For example, take this arithmetic expression:
◊racket-code-block{
; evaluating:
(* (+ 3 2 (/ 5 5)) (- 4 2)) ; multiplication is waiting
(* (+ 3 2 1)       (- 4 2))
(* 6               (- 4 2))
(* 6 2) ; finally backtracking to do the multiplication
12
}

Note that ◊strong{calling} and ◊strong{executing} are two different things. Think of it like "calling" a taxi, it takes time to get here, or it can arrive immediately if nearby. An example of a function call that immediately executes is ◊code{(* 4 9)} because it doesn't have any nested sub-expressions.

Starting from the left most operation to the right most, we see multiplication first!
◊ol{
    ◊li{◊code{(* ...)} is ◊strong{called 1st}, but it is ◊strong{executed last}, becaues it needs all its operands to be values before it can run.}
    ◊li{◊code{(+ 3 2 (/ 5 5))} is ◊strong{called 2nd}, but it is ◊strong{executed later}}
    ◊li{◊code{(/ 5 5)} is ◊strong{called 3rd}, but it is ◊strong{executed 1st!}}
    ◊li{◊code{(+ 3 2 1)} We ◊strong{backtrack} to the + in ◊strong{step 2} and can finally execute it to produce ◊code{6}}
    ◊li{◊code{(- 4 2)} ◊strong{called 4th} and executed immediately since it has no sub functions}
    ◊li{◊code{(* 6 2)} Finally we're ◊strong{backtracking} all the way to step 1 and can ◊strong{execute}}
}

◊h2{Visualizing the Stack}
Programming languages keep track function mechanics by what is called a "stack", which keeps track of
◊ol{
  ◊li{what function is currently executing}
  ◊li{the values of variables called with the function}
  ◊li{the pending functions called but waiting to be executed}
}
The best way to visualize a stack is to think of a physical stack of plates. When you add a new plate, you place it on the very top. When you need to take a plate off, you take the one from the top—which was the last one you put there. This is called a "Last In, First Out" data structure.
Everytime we call a function, we push it ontop of the stack, creating a "stack frame".
The item at the ◊strong{top of the stack} is the operation that ◊strong{is the one that's executing!}

◊img[#:src "./images/stack-eval.svg"]{}

◊stack-step["1. The Initial Call"]{
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ (* (+ 3 2 (/ 5 5)) (- 4 2))        ┃ <--- Root Task
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
}

◊stack-step["2. Pushing the Addition"]{
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ (+ 3 2 (/ 5 5))                    ┃ <--- Pushed
┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃ (* (...) (- 4 2))                  ┃ <--- Pending
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
}

◊stack-step["3. Pushing the Division"]{
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ (/ 5 5)                            ┃ <--- Pushed
┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃ (+ 3 2 (...))                      ┃ <--- Pending
┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃ (* (...) (- 4 2))                  ┃ <--- Pending
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
}

◊stack-step["4. Resolving Division"]{
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ 1                                  ┃ <--- Result
┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃ (+ 3 2 (...))                      ┃ <--- Resuming
┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃ (* (...) (- 4 2))                  ┃ <--- Pending
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
}

◊stack-step["5. Addition Resolved"]{
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ 6                                  ┃ <--- Result
┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃ (* (...) (- 4 2))                  ┃ <--- Resuming
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
}

◊stack-step["6. Pushing Subtraction"]{
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ (- 4 2)                            ┃ <--- Pushed (Current Task)
┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃ (* 6 (...))                        ┃ <--- Now Resuming
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
}

◊stack-step["7. Resolving Subtraction"]{
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ 2                                  ┃ <--- Result
┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃ (* 6 (...))                        ┃ <--- Current Task
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
}

◊stack-step["8. Final Result"]{
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ 12                                 ┃ <--- Final Value
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
}

In reality, very simple functions like math operations aren't really function calls in that they don't push onto a stack frame because it comes with a performance cost, but for our purposes we can imagine it does to explain the mechanics of the stack.

Stack space is limited and if you have too many functions pushing onto the stack, you end up with what is called a "◊strong{stack overflow}". We'll address this problem with accumalators.

◊h2{Visualizing the stack with Debugger}
You can visualize the stack using the racket debugger. The Advanced Student Debugger is kinda buggy though because it has a lot of random "??"", so we're going to switch to the full racket language temporarily to use the debugger. The changes to convert out ISL program to a full racket program is to replace the top line with:
◊racket-code-block{
#lang racket
(require test-engine/racket-tests) ; for check expect to work
}
Note that you should comment out typed signatures, templates, etc

Here are some other good resources on recursion and mutual recursion
◊a[#:href "https://www.youtube.com/watch?v=YuaJ8x_NcLw"]{Nic Barker - Recursion, Explained Simply}