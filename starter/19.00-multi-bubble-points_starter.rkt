;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 19.00-multi-bubble-points_starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)
(define PNAME 'multi-bubble-points)

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

1. Data Description✅
   1B. if using define-struct, write all accessor signatures✅
2. Interpretation✅
3. Data Examples✅
4. A function template that processes this data✅
|#

(define-struct point [x y])
; Point is (make-point Number Number)
; interp.
; x is where the point is in the horizontal, relative to top left
; y is where the point is in the veritcal, relative to top left

(define pt-5-250 (make-point 5 250))
(define pt-10-330 (make-point 10 330))

; point-temp : (Point -> ???)
(define (point-temp pt)
  (... (point-x pt) (point-y pt)))

; ListOfPoint is one of:
; - empty
; - (cons Point ListOfPoint)

; list-point-temp : (ListOfPoint -> ???)
(define (list-point-temp pt-ls)
  (cond
    [(empty? pt-ls) ...]
    [else
     (... (point-temp (first pt-ls))
          (list-point-temp (rest pt-ls)))]))

; =================
#| Functions:
1. Signature, purpose, stub ✅
2. Examples (aka check-expect/tests, elaborate the concrete) ❌
  2B. if the function consumes a list, make sure a list of 2 or longer is tested❌
3. Template(from data)?❌
3. Code body ❌
4. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
|#

#|PROBLEM A:
Notice how the data definition steps are done.
Some parts of the 12.01 bubble-points have been brought over to this file
✅ move-up
✅ draw-point

Finish the function design steps for the folowing functions:
❌bubble-all-points
❌render-all-points
❌click-add
It is recommended you look back to 12.01 bubble-points for inspiration if needed

Uncomment out the on-mouse big-bang clause when you are finished with all
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

; bubble-all-points : (ListOfPoint -> ListOfPoint)
; moves all points up in the ListOfPoint
; BONUS: and removes the ones that are out off the screen(can put this part off until WAY last)
; TODO
(define (bubble-all-points pt-ls) empty)

; render-all-points : (ListOfPoint -> Image)
; draws the bunch of points on a background
; TODO
(define (render-all-points pt-ls) BACKGROUND)

; click-add : (ListOfPoint Number Number MouseEvent -> ListOfPoint)
; add point to world on mouse click
; TODO
(define (click-add pt-ls mousex mousey mevent) empty)

; main: (ListOfPoint -> ListOfPoint)
; start the world with (main empty)

(define (main bunch)
  (big-bang bunch                   ; ListOfPoint
    ; [on-mouse  click-add]      ; ListOfPoint Integer Integer MouseEvent -> ListOfPoint
    [on-tick   bubble-all-points]     ; ListOfPoint -> ListOfPoint
    [to-draw   render-all-points]   ; ListOfPoint -> Image
    ))

;(main empty)