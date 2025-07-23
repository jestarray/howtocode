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
(define HALF-HEIGHT (/ HEIGHT 2))
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

1. Data Description✅
   1B. if using define-struct, write all accessor signatures✅
2. Interpretation✅
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

#|PROBLEM A:
Finish steps Data Design steps: 3(Examples)  for the "Game" struct
Come up with the following data examples for "Game" where:
1) there's a player, with the bullet not fired yet, and a live Enemy
2) there's a player, with a bullet fired, and a live Enemy
3) there's a player, with a bullet who's position is super close to the enemy
3) there's a player, with the bullet and enemy dead
Sketch them out at https://tldraw.com

Finish 4(Template) for the "Game" struct
|#

(define-struct game [player shot invader])
; Game is (make-game Tank MaybeBullet MaybeEnemy)
; interp. represents the game state
; player is the tank that is controlled by the user
; shot is the bullet that might be fired
; invader is the enemy coming down at us
; game-player : (Game -> Tank)
; game-shot : (Game -> MaybeBullet)
; game-invader : (Game -> MaybeEnemy)

(define centered-tank ...)
(define not-yet-shot-game ...)
(define miss-shot-game ...)
(define shot-hit-game ...)
(define player-alone ...)

; game-temp : (Game -> ???)

; =================
#| Functions:
1. Signature, purpose, stub ❌
2. Examples (aka check-expect/tests, elaborate the concrete) ❌
  2B. if the function consumes a list, make sure a list of 2 or longer is tested❌
3. Template(from data)?❌
3. Code body ❌
4. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
|#

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

; (main not-yet-shot-game)