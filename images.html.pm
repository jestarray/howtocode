#lang pollen
◊h1{Images}

Racket has support for drawing images
◊pre[#:class "line-numbers match-braces rainbow-braces"]{
    ◊(code #:class "language-racket"
"(require 2htdp/image) ; MANDATORY! IF NOT HERE, IT WONT WORK

; basic shapes
(triangle 100 \"solid\" \"black\")
(right-triangle 100 100 \"solid\" \"blue\")
(rectangle 200 100 \"solid\" \"red\")
(square 100 \"solid\" \"green\")
(circle 123 \"solid\" \"orange\")

; basic transformations
(rotate 45 (rectangle 200 100 \"solid\" \"red\"))
(flip-horizontal (right-triangle 100 100 \"solid\" \"blue\"))
(flip-vertical (right-triangle 100 100 \"solid\" \"blue\"))

; combining images

(overlay
 (circle 8 \"solid\" \"pink\")
 (circle 16 \"solid\" \"blue\")
 (circle 24 \"solid\" \"red\")
 (circle 32 \"solid\" \"green\"))

(above
 (circle 32 \"solid\" \"green\")
 (rectangle 5 50 \"solid\" \"brown\"))

(beside (rectangle 20 70 \"solid\" \"blue\")
        (rectangle 20 50 \"solid\" \"green\")
        (rectangle 20 30 \"solid\" \"yellow\")
        (rectangle 20 10 \"solid\" \"red\"))

; text-images
(text \"mcdonalds\" 24 \"olive\")
; different from the string mcdonalds

; image properties
(image-width (rectangle 30 40 \"solid\" \"red\"))
(image-height (rectangle 30 40 \"solid\" \"red\"))

; you can also paste in your own
")
}

◊h2{Exercise 1 - Image Shapes}

◊img[#:src "images/shapes.png"]{}
◊; REQUIRES RACEKT/FILE
◊(require racket/file)
◊(define filename "1-imageshapes")
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