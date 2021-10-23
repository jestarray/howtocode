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

◊h2{Exercise 1.0 to 1.4 Image Shapes}

◊img[#:src "images/shapes.png"]{}
◊; REQUIRES RACEKT/FILE
◊(define problem-files (starter-solution "1-imageshapes"))
◊(define starter (car problem-files))
◊(define solution (cadr problem-files))
◊pre[#:class "line-numbers match-braces rainbow-braces" #:data-src ◊(car starter) #:data-download-link ""]{
    ◊(code #:class "language-racket" ◊(cadr starter))
}

◊details{
    ◊summary{Answer}
    ◊pre[#:class "line-numbers match-braces rainbow-braces" #:data-src ◊(car solution) #:data-download-link ""]{
    ◊(code #:class "language-racket" ◊(cadr solution))
}
}

◊h2{Top Left Origin Practice}

◊h3{Middle as origin}
In all the math you have ever done in school, the origin was in the middle and going:
◊ul{
    ◊li{^ up is + ◊strong{positive} Y}
    ◊li{v down is - ◊strong{negative} Y}
}

◊img[#:src "images/cartesian_coordinates.png"]{}


◊h3{Top left as origin}
When working with computers, most often 90% of the time it starts from the top left, and the Y axis is inverted!
◊ul{
    ◊li{^ up is - ◊strong{negative} Y}
    ◊li{v down is + ◊strong{positive} Y}
}

◊img[#:src "images/computer_coordinates.png"]{}

Go to https://www.desmos.com/calculator and drag 0,0 to the top left corner and invert the Y coordinates for more of a visual intution.

Get some practice here by plotting guessing some plot points:

◊a[#:href "./plot_point.html"]{Top left origin practice with plotting points}

◊h2{Exercise 1.2 place-image center}

◊img[#:src "images/fps_crosshair.webp" #:width "100%"]{}
In a lot of 3D shooting games, there are crosshairs to help you aim. Your job is to put the crosshair in the center with place-image

Your result should look like this: with the + centered in the middle
◊img[#:src "images/center_crosshair.png"]{}

◊(define problem-files2 (starter-solution "1.1-crosshair"))
◊(define starter2 (car problem-files2))
◊(define solution2 (cadr problem-files2))

◊pre[#:class "line-numbers match-braces rainbow-braces" #:data-src ◊(car starter2)#:data-download-link ""]{
    ◊(code #:class "language-racket"
◊(cadr starter2))
}

◊details{
    ◊summary{Answer}
    ◊pre[#:class "line-numbers match-braces rainbow-braces" #:data-src ◊(car solution2) #:data-download-link ""]{
    ◊(code #:class "language-racket" ◊(cadr solution2))
}
}

◊h2{Videos}

◊a[#:href "https://www.youtube.com/watch?v=mEMDE9xV9NY&list=PLitFP8FdScfE5nwRovCwdhhW9RTx98q3J&index=6"]{Image Basics Video}

◊a[#:href "https://www.youtube.com/watch?v=-QVQBMp7jMY&list=PLitFP8FdScfE5nwRovCwdhhW9RTx98q3J&index=7"]{Image Exercises video}

◊a[#:href "https://www.youtube.com/watch?v=vs_9A7_HIHA&list=PLitFP8FdScfE5nwRovCwdhhW9RTx98q3J&index=8"]{Top left origin video}