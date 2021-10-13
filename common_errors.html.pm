#lang pollen

◊h1{COMMON ERRORS}

◊(define problem-files (starter-solution "syntaxerror"))
◊(define starter (car problem-files))
◊(define solution (cadr problem-files))
◊pre[#:class "line-numbers match-braces rainbow-braces" #:data-src (car starter) #:data-download-link ""]{
    ◊(code #:class "language-racket" ◊(cadr starter))
}

◊details{
    ◊summary{Answer}
◊pre[#:class "line-numbers match-braces rainbow-braces" #:data-src ◊(car solution) #:data-download-link ""]{
    ◊(code #:class "language-racket" ◊(cadr solution))
}
}

◊h2{Syntax errors}
Syntax errors are errors that prevent code from even running until you fix missing parentheses, spelling, etc. These are usually very easy to spot and you get a friendly error message giving you a hint on how to fix them.

A common mistake that beginners do is to randomly type more code, and ◊a[#:href "https://www.reddit.com/r/Racket/comments/pijf9w/i_need_help_with_this_code/"]{more parentheses} to brute force it to work, but this will only make things worse. Take a deep breath and be very clear on what you need to do and what the code is doing.

Usually syntax errors are things you just learn from trial and error, and someone constantly correcting you so feel free to ask on the racket discord or comments below.

◊h3{Tips for readability}

If you are having trouble with counting the parts up in an expression, mouse over parentheses from left to right to count the pieces needed, or space out and format your code more neatly, like so:

◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"
(+ 1 1(* 3 2)(- 5 4)) ; no formatted well

(+ 1 1 (* 3 2) (- 5 4)) ; much easier on the eyes
")
}

If you delete the starting parens, look to delete the ending one. Think about what each set of parentheses do.

Enable automatic parens is convient because you most often want parentheses in pairs but sometimes it's not always what you want! For example, (+ 1 1 * 3 4)) , say you wanted to add an opening one ◊code{(} in front of the ◊code{*}, be warned it will often insert 2( if you type the opening parenthesis when you really just want one), you can turn this off if you don't like it, but for me it's the common case and makes writing code more smooth.

If you type a closing parens ◊code{)} when there already is a closing parens, racket won't insert unncessary ones till it reaches the end. It also will auto-match the square ones.

Parentheses matter! Be aware of where parentheses wrap around, as it could drastically effect the outcome of a program, aside from creating errors:
◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"
(+ 2 (* 6 1 3 9)) ; 164
(+ 2 (* 6 1 3) 9) ; 29 
")
}

◊h2{Logic errors}

These errors are silent meaning they can be hard to find since they don't crash, but the program is misbehaving. Use the stepper!

◊h3{Problem 1}

◊(define problem-files-buggy (starter-solution "buggy_logic1"))
◊(define starter-buggy (car problem-files-buggy))
◊(define solution-buggy (cadr problem-files-buggy))
◊pre[#:class "line-numbers match-braces rainbow-braces" #:data-src (car starter-buggy) #:data-download-link ""]{
    ◊(code #:class "language-racket" ◊(cadr starter-buggy))
}

◊details{
    ◊summary{Answer}
◊pre[#:class "line-numbers match-braces rainbow-braces" #:data-src ◊(car solution-buggy) #:data-download-link ""]{
    ◊(code #:class "language-racket" ◊(cadr solution-buggy))
}
}

◊h3{Problem 2}
◊(define problem-files-buggy2 (starter-solution "buggy_logic2"))
◊(define starter-buggy2 (car problem-files-buggy2))
◊(define solution-buggy2 (cadr problem-files-buggy2))
◊pre[#:class "line-numbers match-braces rainbow-braces" #:data-src (car starter-buggy2) #:data-download-link ""]{
    ◊(code #:class "language-racket" ◊(cadr starter-buggy2))
}

◊details{
    ◊summary{Answer}
◊pre[#:class "line-numbers match-braces rainbow-braces" #:data-src ◊(car solution-buggy2) #:data-download-link ""]{
    ◊(code #:class "language-racket" ◊(cadr solution-buggy2))
}
}

◊h3{Problem 3}
◊(define problem-files-buggy3 (starter-solution "buggy_logic3"))
◊(define starter-buggy3 (car problem-files-buggy3))
◊(define solution-buggy3 (cadr problem-files-buggy3))
◊pre[#:class "line-numbers match-braces rainbow-braces" #:data-src (car starter-buggy3) #:data-download-link ""]{
    ◊(code #:class "language-racket" ◊(cadr starter-buggy3))
}

◊details{
    ◊summary{Answer}
◊pre[#:class "line-numbers match-braces rainbow-braces" #:data-src ◊(car solution-buggy3) #:data-download-link ""]{
    ◊(code #:class "language-racket" ◊(cadr solution-buggy3))
}
}

◊h3{Problem 4}
◊(define problem-files-buggy4 (starter-solution "buggy_logic4"))
◊(define starter-buggy4 (car problem-files-buggy4))
◊(define solution-buggy4 (cadr problem-files-buggy4))
◊pre[#:class "line-numbers match-braces rainbow-braces" #:data-src (car starter-buggy4) #:data-download-link ""]{
    ◊(code #:class "language-racket" ◊(cadr starter-buggy4))
}

◊details{
    ◊summary{Answer}
◊pre[#:class "line-numbers match-braces rainbow-braces" #:data-src ◊(car solution-buggy4) #:data-download-link ""]{
    ◊(code #:class "language-racket" ◊(cadr solution-buggy4))
}
}