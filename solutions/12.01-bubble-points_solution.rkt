;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 12.01-bubble-points_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)
(define PNAME 'bubble-points)

; =================
; CONSTANTS:

(define WIDTH 400)
(define HEIGHT 400)
(define BACKGROUND (empty-scene WIDTH HEIGHT "blue"))
(define BUBBLE (circle 5 "solid" "grey"))

; =================
#| Data definitions:
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete

1. Data Description❌
   1B. if using define-struct, write all accessor signatures❌
2. Interpretation❌
3. Data Examples❌
4. A function template that processes this data❌
|#

#|PROBLEM A:
Design a world program that moves a Bunch of points up.
The program starts with no points until the user clicks.
At max, there can be 2 points on screen.
Adding more than 2 points will replace the oldest point.
Notice how the data definitions for Point, None, Single, and Couple are done.
Complete the Data Design steps for "BunchOfPoints"
|#

(define-struct point [x y])
; Point is (make-point Number Number)
; interp.
; x is where the point is in the horizontal, relative to top left
; y is where the point is in the veritcal, relative to top left

; point-x : (Point -> Number)
; point-y : (Point -> Number)

(define pt-5-250 (make-point 5 250))
(define pt-10-330 (make-point 10 330))

; point-temp : (Point -> ???)
(define (point-temp pt)
  (... (point-x pt) (point-y pt)))

(define-struct none [])
; None is (make-none)
; interp. represents where there is no Points on the screen

(define-struct single [one])
; Single is (make-single Point)
; interp. represents when there is 1 Point on the screen

; single-one : (Single -> Point)

; single-temp : (Single -> ???)
(define (single-temp sg)
  (... (point-temp (single-one sg))))

(define-struct couple [first second])
; Couple is (make-couple Point Point)
; interp. represents when there are 2 Points on the screen

; couple-first : (Point -> Point)
; couple-second : (Point -> Point)

; couple-temp : (Point -> ???)
(define (couple-temp cp)
  (... (point-temp (couple-first cp))
       (point-temp (couple-second cp))))

; union BunchOfPoints is one of:
; - (make-none)
; - (make-single Point)
; - (make-couple Point Point)
; interp. represents when there are N points on the screen

(define s1 (make-single pt-5-250))
(define c1 (make-couple pt-5-250 pt-10-330))
; bunch-of-points-temp : (BunchOfPoints -> ???)
(define (bunch-of-points-temp bunch)
  (cond
    [(none? bunch)
     (...)]
    [(single? bunch)
     (... (point-temp (single-one bunch)))]
    [(couple? bunch)
     (... (point-temp (couple-first bunch))
          (point-temp (couple-second bunch)))]))

; =================
#| Functions:
1. Signature, purpose, stub ❌
2. Examples (aka check-expect/tests, elaborate the concrete) ❌
  2B. if the function consumes a list, make sure a list of 2 or longer is tested❌
3. Template(from data)?❌
4. Code body ❌
5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
|#

#|PROBLEM B:
Finish the Function design steps for the following functions
(in order of easiest to hardest difficulty)
move-up
draw-point
bubble-points
render
add-point
click-add
Comment out the on-mouse big-bang clause when you are finished with all
|#

; move-up : (Point -> Point)
; produces a point with the y decreased by 1
(check-expect (move-up pt-5-250) (make-point 5 249))
(define (move-up pt)
  (make-point
   (point-x pt)
   (- (point-y pt) 1)))

; draw-point : (Point Image -> Image)
; draws a point on the given background
(check-expect (draw-point pt-5-250 BACKGROUND)
              (place-image
               BUBBLE
               5
               250
               BACKGROUND))

(define (draw-point pt background)
  (place-image
   BUBBLE
   (point-x pt)
   (point-y pt)
   background))

; bubble-points : (BunchOfPoints -> BunchOfPoints)
; moves all points up in the BunchOfPoints
(check-expect (bubble-points (make-none)) (make-none))
(check-expect (bubble-points (make-single pt-5-250))
              (make-single (make-point 5 249)))
(check-expect (bubble-points (make-couple pt-5-250 pt-10-330))
              (make-couple (make-point 5 249) (make-point 10 329)))
(define (bubble-points bunch)
  (cond
    [(none? bunch)
     (make-none)]
    [(single? bunch)
     (make-single
      (move-up (single-one bunch)))]
    [(couple? bunch)
     (make-couple
      (move-up (couple-first bunch))
      (move-up (couple-second bunch)))]))

; render : (BunchOfPoints -> Image)
; draws the bunch of points on a background
(check-expect (render (make-none)) BACKGROUND)
(check-expect (render (make-single pt-5-250))
              (place-image
               BUBBLE
               5 250 BACKGROUND))
(check-expect (render (make-couple pt-5-250 pt-10-330))
              (place-image
               BUBBLE
               5 250
               (place-image
                BUBBLE
                10 330
                BACKGROUND)))
(define (render bunch)
  (cond
    [(none? bunch)
     BACKGROUND]
    [(single? bunch)
     (draw-point (single-one bunch) BACKGROUND)]
    [(couple? bunch)
     (draw-point
      (couple-first bunch)
      (draw-point
       (couple-second bunch)
       BACKGROUND))
     ]))

; add-point : (BunchOfPoints Number Number -> BunchOfPoints)
; adds a point at the given x and y
; if BunchOfPoints is a couple, the oldest point should be in the 2nd position
(check-expect (add-point (make-none) 20 30)
              (make-single (make-point 20 30)))

(check-expect (add-point (make-single (make-point 20 30)) 50 60)
              (make-couple
               (make-point 50 60)
               (make-point 20 30)))

(check-expect
 (add-point
  (make-couple
   (make-point 20 30)
   (make-point 50 60)) 80 50)
 (make-couple
  (make-point 80 50)
  (make-point 20 30)))

(define (add-point bunch x y)
  (cond
    [(none? bunch)
     (make-single (make-point x y))]
    [(single? bunch)
     (make-couple
      (make-point x y)
      (single-one bunch))]
    [(couple? bunch)
     (make-couple
      (make-point x y)
      (couple-first bunch))]))

; click-add : (BunchOfPoints Number Number MouseEvent -> BunchOfPoints)
; add point to world on mouse click
; HINT: use "add-point"
(check-expect (click-add (make-none) 20 30 "button-down")
              (make-single (make-point 20 30)))
(check-expect (click-add (make-none) 30 40 "enter")
              (make-none))
(define (click-add bunch mousex mousey mevent)
  (cond [(mouse=? mevent "button-down")
         (add-point bunch mousex mousey)]
        [else
         bunch]))

; main: (BunchOfPoints -> BunchOfPoints)
; start the world with (main (make-none))

(define (main bunch)
  (big-bang bunch                   ; BunchOfPoints
    [on-mouse  click-add]      ; BunchOfPoints Integer Integer MouseEvent -> BunchOfPoints
    [on-tick   bubble-points]     ; BunchOfPoints -> BunchOfPoints
    [to-draw   render]   ; BunchOfPoints -> Image
    ))

(main (make-none))