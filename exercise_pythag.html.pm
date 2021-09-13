#lang pollen
◊(require racket/file)
◊h1{Exercise 0 - Pythag}

◊(define filename "0-pythag")
◊(define starter (string-append "starter/" filename "_starter.rkt"))
◊;(define filepath "code/start_exercise_template.rkt")
◊pre[#:class "line-numbers match-braces rainbow-braces" #:data-src starter #:data-download-link ""]{
    ◊(code #:class "language-racket" ◊(file->string starter #:mode 'text))
}
◊(define solution (string-append "solutions/" filename "_solution.rkt"))
◊details{
    ◊summary{Answer}
    ◊pre[#:class "line-numbers match-braces rainbow-braces" #:data-src solution #:data-download-link ""]{
    ◊(code #:class "language-racket" ◊(file->string solution))
}
}