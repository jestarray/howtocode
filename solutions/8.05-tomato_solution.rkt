;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 8.05-tomato_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'tomato)

(require 2htdp/image)
(require 2htdp/universe)

#|PROBLEM A:
Design a world program that rolls a tomato from the left side of the screen to right.
Use '🍅' with (text) for an image of a tomato.
Call your compound data 'tomato'

NOTE: Even though this problem can be done without compound data, please use a struct def
to represent position and angle of rotation
|#

#|PROBLEM B:
Reset the position of the tomato to the start when the 'r' key is pressed.
|#

; =================
; CONSTANTS:

(define WIDTH 400)
(define HEIGHT 100)
(define CENTER-Y (/ HEIGHT 2))
(define BG (empty-scene WIDTH HEIGHT))
(define TOMATO-IMG (text "🍅" 50 "red"))
(define ROTATE-SPEED -4)
(define SPEED 4)

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

(define-struct tomato [x angle])
; Tomato is (make-Tomato Number Number)
; interp. 
; x is how far from left side of screen in pixels
; angle is degrees of rotation

(define t0 (make-tomato 0 0))
(define 90d (make-tomato 40 90)) ; x: 40, rotation: 90 counter clockwise

; =================
#| Functions:
1. Signature, purpose, stub ✅
2. Examples (aka check-expect, elaborate the concrete) ✅
3. Template(from data)?✅
4. Code body ✅
5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#

; ############################################################################

; main: (Tomato -> Tomato)
; start the world with (main (make-tomato 0 0))
(define (main tm)
  (big-bang tm                   ; Tomato
    [on-key    handle-key]      ; Tomato KeyEvent -> Tomato
    [on-tick   tock]     ; Tomato -> Tomato
    [to-draw   render]   ; Tomato -> Image
    ))

; tock: (Tomato -> Tomato)
; produce tomato with increased x and rotation
(check-expect (tock t0) (make-tomato (+ SPEED 0) (+ ROTATE-SPEED 0)))

(define (tock tm)
  (make-tomato 
   (+ SPEED (tomato-x tm))
   (+ ROTATE-SPEED (tomato-angle tm))))

; render: (Tomato -> Image)
; produce image of the given tomato at the given x, rotated ontop of the background
(check-expect (render (make-tomato 30 90))
              (place-image
               (rotate 90 TOMATO-IMG)
               30
               CENTER-Y
               BG))

(define (render tm)
  (place-image
   (rotate (tomato-angle tm) TOMATO-IMG)
   (tomato-x tm)
   CENTER-Y
   BG))

; handle-key: (Tomato KeyEvent -> Tomato)
; produce a tomato at x: 0 rotation: 0 when 'r' key is pressed
(check-expect (handle-key (make-tomato 30 90) "r")
              (make-tomato 0 0))
(check-expect (handle-key (make-tomato 42 12) " ")
              (make-tomato 42 12))

(define (handle-key tm ke)
  (cond
    [(key=? ke "r")
     (make-tomato 0 0)]
    [else
     tm]))