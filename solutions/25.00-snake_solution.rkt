#lang htdp/isl+
(require 2htdp/image)
(require 2htdp/universe)
(define PNAME 'snake)

; =================
; CONSTANTS:
(define CELL-SIZE 16)

(define TILE-WIDTH 22)
(define TILE-HEIGHT 22)
(define WIDTH (* TILE-WIDTH CELL-SIZE))
(define HEIGHT (* TILE-HEIGHT CELL-SIZE))
(define HALF-WIDTH (/ WIDTH 2))
(define HALF-HEIGHT (/ HEIGHT 2))

(define WIDTH-IN-CELLS (/ WIDTH CELL-SIZE))
(define HEIGHT-IN-CELLS (/ HEIGHT CELL-SIZE))
(define HALF-WIDTH-IN-CELLS (/ WIDTH-IN-CELLS 2))
(define HALF-HEIGHT-IN-CELLS (/ HEIGHT-IN-CELLS 2))
(define BACKGROUND (empty-scene WIDTH HEIGHT "black"))
(define SQUARE-IMG (square CELL-SIZE "solid" "white"))

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
; x horizontal point, relative to top left, in grid units
; y vertical point, relative to top left, in grid units

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

(define-struct game [snake vel food])
; Game is (make-game ListOfPoint Point Point)
; interp.
; snake is a ListOfPoints where the head is the first element of the list, and the rest is the body, all in grid cords
; vel is the velocity(direction) the snake is moving in, in grid cords
; food is a point where it is located at in grid cords

; a snake at the center of the screen with food at (5, 7), not moving
(define initial-game
  (make-game
   (list (make-point HALF-WIDTH-IN-CELLS HALF-HEIGHT-IN-CELLS))
   (make-point 0 0)
   (make-point 5 7)))

(define eaten-food-game
  (make-game
   (list (make-point 4 5) (make-point 3 5))
   (make-point 1 0)
   (make-point 4 5)))

; head was at 4, 5 but ate tail at 4, 4
(define eaten-self-game 
  (make-game
   (list (make-point 4 4) (make-point 5 4) (make-point 5 3) (make-point 4 4))
   (make-point 0 -1)
   (make-point 9 9)))

; =================
#| Functions:
1. Signature, purpose, stub ✅
2. Examples (aka check-expect/tests, elaborate the concrete) ✅
  2B. if the function consumes a list, make sure a list of 2 or longer is tested✅
3. Template(from data)?✅
3. Code body ✅
4. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#

#|PROBLEM A:
Write the video game snake
https://en.wikipedia.org/wiki/Snake_(video_game_genre)
https://playsnake.org/

Notice how the data definition steps are done and some functions have been provided for you:
✅add-point
✅point=?

If you're struggling, write data examples of game, where the snake is eating itself, moving, etc

Finish the function design steps for the folowing functions(from easiest to hardest):
✅point-offscreen?
✅draw-square@grid
✅render-snake
✅render-game
✅update-snake
✅ate-self?
✅update-game
✅handle-key
✅game-over?(composes ate-self? and point-offscreen?)

Remember big-bang mainly needs "on-tick" and "to-draw". You can comment out the rest until later
Challenges:
Add keeping track of a score and rendering it on the top right
|#

; add-point : (Point Point -> Point)
; adds x & y from point2 onto point1
(check-expect (add-point (make-point 1 2) (make-point 1 1))
              (make-point 2 3))
(define (add-point p1 p2)
  (make-point (+ (point-x p1) (point-x p2))
              (+ (point-y p1) (point-y p2))))

; point=? : (Point Point -> Boolean)
; produces true if the x & y of one point is equal to the other
(check-expect (point=? (make-point 3 1) (make-point 3 1)) #true)
(check-expect (point=? (make-point 3 1) (make-point 0 1)) #false)
(define (point=? p1 p2)
  (and (= (point-x p1) (point-x p2))
       (= (point-y p1) (point-y p2))))

; point-offscreen? : (Point -> Boolean)
; produces if the grid-aligned point is off the screen
(check-expect (point-offscreen? (make-point 4 3)) #false)
(check-expect (point-offscreen? (make-point -1 0)) #true) ; off the left edge
(check-expect (point-offscreen? (make-point 0 -1)) #true) ; off the top edge
(check-expect (point-offscreen? (make-point (add1 WIDTH-IN-CELLS) 0)) #true) ; right edge
(check-expect (point-offscreen? (make-point 0 (add1 HEIGHT-IN-CELLS))) #true) ; bot edge
(define (point-offscreen? pt)
  (or (< (point-x pt) 0)
      (< (point-y pt) 0)
      (>= (point-x pt) WIDTH-IN-CELLS)
      (>= (point-y pt) HEIGHT-IN-CELLS)))

; draw-square@grid : (Point Image -> Image)
; draw the given grid aligned point in pixels ontop of the given background
(check-expect (draw-square@grid (make-point 5 9) BACKGROUND)
              (place-image/align SQUARE-IMG (* 5 CELL-SIZE) (* 9 CELL-SIZE)
                                 "left"
                                 "top"
                                 BACKGROUND))
(define (draw-square@grid pt background)
  (place-image/align
   SQUARE-IMG
   (* (point-x pt) CELL-SIZE)
   (* (point-y pt) CELL-SIZE)
   "left"
   "top"
   background))

; render-snake : (ListOfPoint -> Image)
; draws the snake on the background
(check-expect (render-snake empty) BACKGROUND)
(check-expect (render-snake (list (make-point 20 30)))
              (draw-square@grid (make-point 20 30) BACKGROUND))
(check-expect (render-snake (list (make-point 20 30)
                                  (make-point 50 60)))
              (draw-square@grid (make-point 20 30)
                                (draw-square@grid (make-point 50 60) BACKGROUND)))
(define (render-snake pt-ls)
  (cond
    [(empty? pt-ls) BACKGROUND]
    [else
     (draw-square@grid (first pt-ls)
                       (render-snake (rest pt-ls)))]))

; render-game : (Game -> Image)
; draws the food and the snake
; <tests are omitted, this is a wapper function>
(define (render-game gm)
  (draw-square@grid (game-food gm)
                    (render-snake (game-snake gm))))

; update-snake : (ListOfPoint Point Point -> ListOfPoint)
; moves the snake by the given velocity by adding a head with the velocity and removing the last element
; if it did collided with the food then we grow the snake(by not removing the last element)

; snake moving normally
(check-expect (update-snake (list (make-point 4 5) (make-point 3 5))
                            (make-point 0 1)
                            (make-point 2 4))
              (list (make-point 4 6)
                    (make-point 4 5)))

; snake ate food
(check-expect (update-snake (list (make-point 4 5) (make-point 3 5))
                            (make-point 1 0)
                            (make-point 4 5))
              (list (make-point 5 5)
                    (make-point 4 5)
                    (make-point 3 5)))

(define (update-snake pt-ls vel food)
  (cond
    [(point=? food (first pt-ls))
     ; ate food, grow the snake
     (cons (add-point (first pt-ls) vel)
           pt-ls)]
    [else
     ; move snake
     (cons (add-point (first pt-ls) vel)
           (reverse (rest (reverse pt-ls))))]))

; ate-self? : (ListOfPoint -> Boolean)
; produces #true if the snake head ate its body
(check-expect (ate-self? (list (make-point 4 4) (make-point 5 4) (make-point 5 3) (make-point 4 4)))
              #true)
(check-expect (ate-self? (game-snake initial-game)) #false)
(define (ate-self? pt-lst)
  (local
    [(define head (first pt-lst))
     ; hit-self : (Point -> Boolean)
     ; produces #true if the head overlaps any of the body points
     (define (hit-self? pt)
       (point=? head pt))]
    (ormap hit-self? (rest pt-lst))))

; update-game : (Game -> Game)
; updates the snake and spawns new random food if it was eaten by the snake 
(define (update-game gm)
  (local
    [(define moved-snake
       (update-snake (game-snake gm) (game-vel gm) (game-food gm)))]
    (make-game
     moved-snake
     (game-vel gm)
     (if (= (length moved-snake) (length (game-snake gm)))
         (game-food gm)
         (make-point (random WIDTH-IN-CELLS) (random HEIGHT-IN-CELLS))))))

(define MOVING-LEFT (make-point -1 0))
(define MOVING-RIGHT (make-point 1 0))
(define MOVING-UP (make-point 0 -1))
(define MOVING-DOWN (make-point 0 1))

; handle-key : (Game KeyEvent -> Game)
; moves the snake using the arrow keys, while preventing instant 180 degree turns
(check-expect (handle-key initial-game " ")
              initial-game)
; do not allow instant 180 uturn when pressing up arrow while moving down
(check-expect
 (handle-key
  (make-game (list (make-point 3 2) (make-point 3 1) (make-point 2 1))
             MOVING-DOWN (make-point 9 9)) "up")
 (make-game (list (make-point 3 2) (make-point 3 1) (make-point 2 1))
            MOVING-DOWN (make-point 9 9)))

(define (handle-key gm pressed)
  (make-game
   (game-snake gm)
   (cond
     [(and (key=? "left" pressed) (zero? (point-x (game-vel gm))))
      MOVING-LEFT]
     [(and (key=? "right" pressed) (zero? (point-x (game-vel gm))))
      MOVING-RIGHT]
     [(and (key=? "up" pressed) (zero? (point-y (game-vel gm))))
      MOVING-UP]
     [(and (key=? "down" pressed) (zero? (point-y (game-vel gm))))
      MOVING-DOWN]
     [else
      (game-vel gm)])
   (game-food gm)))

; game-over? : (Game -> Boolean)
; produces #true when the snake eats itself or hits the edges of the screen
; <tests omitted>
(define (game-over? gm)
  (or (ate-self? (game-snake gm))
      (point-offscreen? (first (game-snake gm)))))

; main: (Game -> Game)
; start the world with (main initial-game)
(define (main gm)
  (big-bang gm
    [on-key handle-key]
    [on-tick   update-game 0.2]     ; Game -> Game
    [to-draw   render-game]   ; Game -> Image
    [stop-when game-over?]
    ))

(main initial-game)