;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 12.02-space-infestors-p1_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)
(define PNAME 'space-infestors-p1)

; =================
; CONSTANTS:
(define WIDTH 300)
(define HEIGHT 500)

(define HALF-WIDTH (/ WIDTH 2))
(define BACKGROUND (empty-scene WIDTH HEIGHT "black"))
(define ENEMY-IMG (text "👾" 26 "red"))

(define TANK-IMG (text "🚢" 26 "blue"))
(define BULLET-IMG (rectangle 5 30 "solid" "yellow"))

(define BULLET-SPEED -5)
(define ENEMY-SPEED 1)
(define TANK-SPEED 2)

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

(define-struct point [x y])
; Point is (make-point Number Number)
; interp. self explanitory
; point-x: (Point -> Number)
; point-y : (Point -> Number)
(define (point-temp pt)
  (... (point-x pt) (point-y pt)))

(define-struct tank [x vel-x])
; Tank is (make-tank Number Number)
; interp.
; x is the horizontal position of the tank
; vel-x is which direction it is moving in the x-axis
; tank-x : (Tank -> Number)
; tank-vel-x : (Tanks -> Number)
(define (tank-temp tk)
  (... (tank-x tk) (tank-vel-x tk)))

; Enemy is (make-point Number Number)

; union MaybeEnemy is one of:
; - #false
; - (make-point Number Number)
; interp.
; #false means the enemy is dead
; point means the enemy is alive at the point position
(define (maybe-enemy-temp enemy)
  (cond
    [(boolean? enemy) ...]
    [(point? enemy)
     (... (point-x enemy) (point-y enemy))]))

; Bullet is (make-point Number Number)

; union MaybeBullet is one of:
; - #false
; - (make-point Number Number)
; interp.
; #false means the bullet is dead(not on screen/fired)
; point means the bullet is shot at the point position
(define (maybe-bullet-temp bull)
  (cond
    [(boolean? bull) ...]
    [(point? bull)
     (... (point-x bull) (point-y bull))]))

(define-struct game [player shot invader])
; Game is (make-game Tank MaybeBullet MaybeEnemy)
; interp. represents the game state
; player is the tank that is controlled by the user
; shot is the bullet that might be fired
; invader is the enemy coming down at us
; game-player : (Game -> Tank)
; game-shot : (Game -> MaybeBullet)
; game-invader : (Game -> MaybeEnemy)
(define (game-temp gm)
  (...
   (tank-temp (game-player gm))
   (maybe-bullet-temp (game-shot gm))
   (maybe-enemy-temp (game-invader gm))))

#|PROBLEM A:
Come up with 3 data examples for "Game" where:
1) there's a player, with the bullet not fired yet, and an Enemy
2) there's a player, with a bullet fired, and an Enemy
3) there's a player, with the bullet and enemy dead
Sketch them out at https://tldraw.com
|#
(define centered-tank (make-tank HALF-WIDTH 0))
(define non-fired-game (make-game centered-tank #false (make-point 20 0)))
(define player-win (make-game centered-tank #false #false))

#|PROBLEM B:
Finish the function design steps for:
draw-minvader
draw-mbullet
draw-tank
render
|#

; draw-minvader : (MaybeEnemy Image -> Image)
; draws the invader at its given coordinates if it is alive
; otherwise produce the given background(bg)


; draw-mbullet : (MaybeBullet Image -> Image)
; draws the bullet at its given coordinates if it is alive
; otherwise produce the given background(bg)

; draw-tank : (Tank Image -> Image)
; draws the tank at its given x coordinate at the bottom of the screen
; otherwise produce the given background(bg)

; render : (Game -> Image)
; produces an image of the tank, invader, and bullet all ontop of a background
; hint: this function should call draw-mbullet, draw-minvader, draw-tank
; <tests are omitted>
(define (render gm) BACKGROUND)

(define (main gm)
  (big-bang
      gm
    [to-draw render]))

(main non-fired-game)