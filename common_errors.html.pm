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

◊h2{Videos}

◊a[#:href "https://youtu.be/D799OanbrYk"]{Common Erorrs}