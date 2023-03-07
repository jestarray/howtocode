;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 8.07-ripple_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'ripple)

(require 2htdp/image)
(require 2htdp/universe)

#| PROBLEM A:
Design a world program that animates a water ripple spawning where the user clicked.
If the user clicked, spawn a new smaller ripple with a radius of 0
Call your compound data definition 'ripple'.
Make it so the ripples radius grows 4 pixels per tick

It should look like the following with the circle expanding over time: 
https://howtocode.pages.dev/images/ripple.png

HINT: You can use a blue background and a growing white outlined circle to make it look like a ripple.

HINT2: If you are struggling, first try to animate a growing white circle on a blue background,
and then add mouse interaction after.
|#

; =================
; CONSTANTS:
(define WIDTH 400)
(define HEIGHT 400)
(define BG (empty-scene WIDTH HEIGHT "blue"))
(define RIPPLE-GROWTH 4)

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
(define-struct ripple [x y radius])
; Ripple is (make-ripple Number Number Number)
; - x & y is the centerpoint of where the ripple spawns
; - radius is how big the ripple is

(define r0 (make-ripple 0 0 4))

(define (ripple-temp rp)
  (...
   (ripple-x rp)
   (ripple-y rp)
   (ripple-radius rp)))

; =================
#| Functions:
1. Signature, purpose, stub ✅
2. Examples (aka check-expect, elaborate the concrete)✅
3. Template(from data)?✅
3. Code body ✅
4. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#

; main: (WS -> WS)
; start the world with (main (make-ripple 0 0 0))
; 
(define (main ws)
  (big-bang ws                   ; WS
    [on-mouse  handle-mouse]      ; WS Integer Integer MouseEvent -> WS
    [on-tick   tock]     ; WS -> WS
    [to-draw   render]   ; WS -> Image
    ))

; tock: (WS -> WS)
; produce a ripple that grows in radius
(check-expect (tock (make-ripple 0 0 2))
              (make-ripple 0 0 (+ 2 RIPPLE-GROWTH)))
(define (tock ws)
  (make-ripple
   (ripple-x ws)
   (ripple-y ws)
   (+ (ripple-radius ws) RIPPLE-GROWTH)))


; render: (WS -> Image)
; draw the given ripple
(check-expect (render (make-ripple 30 20 25))
              (place-image
               (circle 25 "outline" "white")
               30
               20
               BG))

(define (render ws)
  (place-image
   (circle (ripple-radius ws) "outline" "white")
   (ripple-x ws)
   (ripple-y ws)
   BG))

; handle-mouse: (WS Number Number MouseEvent -> WS)
; produce the ripple at where the mouse is if user clicked
(check-expect (handle-mouse (make-ripple 1 2 3) 32 42 "button-down")
              (make-ripple 32 42 0))
(check-expect (handle-mouse (make-ripple 1 2 3) 32 42 "drag")
              (make-ripple 1 2 3))

(define (handle-mouse ws mousex mousey me)
  (cond
    [(mouse=? me "button-down")
     (make-ripple mousex mousey 0)]
    [else
     ws]))