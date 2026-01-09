;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 8.04-box-spin_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'box-spin)

(require 2htdp/image)
(require 2htdp/universe)

#|PROBLEM A:
Design a world program that grows a rotating red square that is always centered like the
following image: https://howtocode.pages.dev/images/box_spin.png

Call your data 'box'
NOTE: This can be done without compound data but please use a compound data definition.
Follow the HTDW recipe
|#

#|PROBLEM B:
Make it so pressing 'r' resets the rotating square to its initial size
|#

; =================
; CONSTANTS:
(define WIDTH 300)
(define HEIGHT 300)
(define CENTER-X (/ WIDTH 2))
(define CENTER-Y (/ HEIGHT 2))

(define ROTATION-SPEED 4)
(define GROWTH-SPEED 1)
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

(define-struct box [size angle])
; Box is (make-box Natural Natural)
; interp. size is side lengths of square, angle is measured in degrees
(define b1 (make-box 10 360))

(define (box-temp bx)
  (... 
   (box-size bx)
   (box-angle bx)))

; =================
#| Functions:
1. Signature, purpose, stub ✅
2. Examples (aka check-expect, elaborate the concrete) ✅
3. Template(from data)?✅
4. Code body ✅
5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#

; ############################################################################

; main: (Box -> Box)
; start the world with
; (main (make-box 0 0)) 
(define (main bx)
  (big-bang bx                   ; Box
    [on-key    handle-key]      ; Box KeyEvent -> Box
    [on-tick   tock]     ; Box -> Box
    [to-draw   render]   ; Box -> Image
    ))

; tock: (Box -> Box)
; produce a box that increases in size and height
(check-expect (tock (make-box 4 6)) (make-box (+ 4 GROWTH-SPEED) (+ 6 ROTATION-SPEED)))

; (define (tock bx) (make-box 0 0))
(define (tock bx) 
  (make-box (+ (box-size bx) GROWTH-SPEED)
            (+ (box-angle bx) ROTATION-SPEED)))


; render: (Box -> Image)
; produce image of the given box at the given size and rotated by given angle
(check-expect (render (make-box 20 90))
              (place-image (rotate 90 (square 20 "solid" "red")) CENTER-X CENTER-Y BG))

(define (render bx)
  (place-image
   (rotate (box-angle bx) (square (box-size bx) "solid" "red"))
   CENTER-X
   CENTER-Y
   BG))

; handle-key: (Box KeyEvent -> Box)
; resets the box size and angle to zero when r is pressed
(check-expect (handle-key (make-box 10 20) "r") (make-box 0 0))
(check-expect (handle-key (make-box 10 20) " ") (make-box 10 20))
(define (handle-key bx ke)
  (cond [(key=? ke "r") 
         (make-box 0 0)]
        [else 
         bx]))