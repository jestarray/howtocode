#lang pollen

◊h1{What is Generative Recursion aka Algorithms?}

Although most of the functions programmers write will be structurally recursive, that is that the function template will just fall out of the data definition:
◊racket-code-block{
; A ListOfNumber is one of:
; - empty
; - (cons Number ListOfNumber) ; first and rest

(define (list-num-temp lst)
  (cond
    [(empty? lst) ...]
    [else
     (... (first lst) ; Number
          ; recursive call is straight from the data def
          (list-num-temp (rest lst)))]))
}

Generative recursion is where the recursive call is less based on the structure of the data, and more from the problems ◊strong{domain knowledge}. It could draw upon descriptions of math formulas, fractals, real life algorithms, and many more. It could require you to rearrange the problem, solve several related sub problems, and then combining them together before you do the recursive call. They often vary but they look somewhat like this:
◊racket-code-block{
(define (gen-rec-fn p)
  (cond
    [(trivial? p) (solve p)]
    [else
     (combine-solutions
       p
       (gen-rec-fn
         (sub-problem p)))]))
}

You will ◊strong{still} have a base case, you will ◊strong{still} have a recursive call, it's just that it isn't always going to be so obvious compared to structural recursion. You won't ◊strong{always} have your base case checking for ◊code{empty}, or have your recursive call on ◊strong{(rest lst)}. You'll have to derive that from elaborating and coming up with the extra insight, the ◊strong{AHA} moment, yourself.

◊h2{Fractals}
◊slide{
◊h2{Serpinski's Triangle}
◊img[#:src "./images/triangle_fractal.png"]{}
}

◊h2{Fractals step by step animation}
◊slide{
◊img[#:src "./images/triangle_fractal_animation.webp"]{}
}

◊slide{
Serpinski's Triangle fractal contains a bunch of equalateral triangles with shrinking side lengths. Therefore, the best data type to represent side lengths are numbers, so we end up with this signature:
◊racket-code-block{
; s-triangle : (Number -> Image)
(define (s-triangle side) empty-image)
}
}

Now we need to answer the qestions of generative recursion. 
What is the ◊em{trival} case? 
The trival case is what happens if we are given a side lengh that is too small? Well then we should have a base case that is the smallest triangle.

How do we combine the results of the trival case and potential sub problems to solve the overarching problem? Aka, the generative case!
Since the base case gives us a triangle back, we need to put one triangle beside it, and then one above it to make the 3 stack triangle.

How does it terminate?
The given number(side-length) is getting halved at every step, therefore shrinking towards SMALL,

We start off wanting to draw a big fractal but the smaller ones have to be drawn first and then used in the building of the bigger one. I recommended you use the stepper to understand how ◊code{s-triangle} mechanically works.

The book ◊a[#:href "https://htdp.org/2025-12-27/Book/part_five.html#(part._sec~3afractal)"]{How to Design Programs Book(spoilers)}'s has a detailed guide on deconstructing this fractal.