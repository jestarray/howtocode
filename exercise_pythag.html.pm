#lang pollen
◊(require racket/file)
◊h1{Exercise 0 - Pythag}

◊(define filepath "code/0-pythag-starter.rkt")
◊;(define filepath "code/start_exercise_template.rkt")
◊(define get-code (file->string filepath #:mode 'text))
◊pre[#:class "line-numbers match-braces rainbow-braces" #:data-src filepath #:data-download-link ""]{
    ◊(code #:class "language-racket" ◊get-code)
}