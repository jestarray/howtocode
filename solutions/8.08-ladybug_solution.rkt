;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 8.08-ladybug_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'ladybug)

(require 2htdp/image)
(require 2htdp/universe)
(require 2htdp/planetcute)


#|PROBLEM A:
Design a world program that walks a ladybug back and forth, from left to right, and then back
from right to left when it hits the left and right edge respectively. 
The lady bug should also render the facing direction based on the walking
direction.

Call your struct lady

HINT: We have provided you the lady bug image facing left and right as constants
|#

; =================
; CONSTANTS:
(define RIGHT-IMG enemy-bug)
(define LEFT-IMG (flip-horizontal enemy-bug))

(define WIDTH 400)
(define HEIGHT 200)
(define BG (empty-scene WIDTH HEIGHT "green"))

(define CENTER-Y (/ HEIGHT 2))
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

(define-struct lady [x vx])
; Lady is (make-lady Number  Number)
; interp. x is horizontal direction in pixels, vx is x-velocity
(define l0 (make-lady 0 SPEED)) ; ladybug way at the left moving right

(define (lady-temp ld)
  (...
   (lady-x ld)
   (lady-y ld)))

; =================
#| Functions:
1. Signature, purpose, stub ✅
2. Examples (aka check-expect, elaborate the concrete) ✅
3. Template(from data)?✅
4. Code body ✅
5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#

; ############################################################################

; main: (Lady -> Lady)
; start the world with (main (make-lady 0 0))
(define (main ld)
  (big-bang ld
    [on-tick   tock]     ; Lady ->Lady 
    [to-draw   render]   ; Lady -> Image
    ))

; tock: (Lady -> Lady)
; produce the ladybug moving by vx until it hits the right edge
(check-expect (tock l0) (make-lady (+ SPEED 0) SPEED))
(check-expect (tock (make-lady 500 SPEED)) (make-lady WIDTH (- SPEED)))
(check-expect (tock (make-lady -4 (- SPEED))) (make-lady 0 SPEED))

(define (tock ld)
  (cond
    [(> (lady-x ld) WIDTH)
     (make-lady WIDTH (* -1 (lady-vx ld)))]
    [(< (lady-x ld) 0)
     (make-lady 0 (* -1 (lady-vx ld)))]
    [else
     (make-lady 
      (+ (lady-x ld) (lady-vx ld))
      (lady-vx ld))]))


; render: (Lady -> Image)
; draw the lady bug in the correct position and facing direction
(check-expect (render l0)
              (place-image
               RIGHT-IMG
               0
               CENTER-Y
               BG))
(check-expect (render (make-lady 400 (- SPEED)))
              (place-image
               LEFT-IMG 
               400
               CENTER-Y
               BG))

(define (render ld)
  (place-image
   (if (positive? (lady-vx ld))
       RIGHT-IMG
       LEFT-IMG)
   (lady-x ld)
   CENTER-Y
   BG))