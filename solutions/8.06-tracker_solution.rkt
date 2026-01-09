;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 8.06-tracker_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'tracker)

(require 2htdp/image)
(require 2htdp/universe)

#|PROBLEM A:
Design a world program that displays the mouses x & y coordinates at the position where ever the 
mouse is. So if the mouse moves, the coordinates move, along with the position of the text itself.
Call your data definition 'point'.
It should look like the following image:

where coordinates are formatted like so: '(x, y)'
|#

; =================
; CONSTANTS:
(define WIDTH 400)
(define HEIGHT 400)
(define FONT-SIZE 16)
(define FONT-COLOR "black")
(define BG (empty-scene WIDTH HEIGHT))

; =================
#| Data definitions:
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete

1. Data Description✅
2. Interpretation✅
3. Data Examples✅
4. A function template that processes this data✅
|#
(define-struct point [x y])
; Point is (make-point Number Number)
; interp. position of mouse in pixels
(define p0 (make-point 0 0))

(define (point-temp pt)
  (... (point-x pt)
       (point-y pt)))

; =================
#| Functions:
1. Signature, purpose, stub ✅
2. Examples (aka check-expect, elaborate the concrete) ✅
3. Template(from data)?✅
4. Code body ✅
5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#

; ############################################################################

; main: (Point -> Point)
; start the world with (main (make-point 0 0))
(define (main pt)
  (big-bang pt                   ; Point
    [on-mouse  handle-mouse]      ; Point Integer Integer MouseEvent -> Point
    [to-draw   render]   ; Point -> Image
    ))

; handle-key: (Point KeyEvent -> Point)
(check-expect (handle-mouse (make-point 0 0) 10 20 "move")
              (make-point 10 20))
(check-expect (handle-mouse (make-point 0 0) 10 20 "button-down")
              (make-point 0 0))

; (define (handle-key pt mousex mousey me) (make-point 0 0 ))
(define (handle-mouse pt mousex mousey me)
  (cond
    [(mouse=? me "move")
     (make-point mousex mousey)]
    [else
     pt]))


; render: (Point -> Image)
; draw numbers of position at where the position is
(check-expect (render (make-point 10 20))
              (place-image (text "(10, 20)" FONT-SIZE FONT-COLOR) 10 20 BG))
; (define (render pt) emtpy-image)
(define (render pt)
  (place-image
   (text 
    (string-append
     "(" 
     (number->string (point-x pt))
     ", "
     (number->string (point-y pt)) ")")
    FONT-SIZE
    FONT-COLOR)
   (point-x pt)
   (point-y pt)
   BG))