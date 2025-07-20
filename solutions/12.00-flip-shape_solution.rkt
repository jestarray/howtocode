;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 12.00-flip-shape_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)
(define PNAME 'flip-shape)

; =================
; CONSTANTS:

(define WIDTH 400)
(define HEIGHT 400)
(define BACKGROUND (empty-scene WIDTH HEIGHT))
(define HALF-WIDTH (/ WIDTH 2))
(define HALF-HEIGHT (/ HEIGHT 2))

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

(define-struct disc [radius])
; Disc is (make-disc Number)
; interp. represents a disc with a radius
; disc-radius : (Disc -> Number)

(define ds-30 (make-disc 30))

; disc-temp: (Disc -> ???)
(define (disc-temp ds)
  (... (disc-radius ds)))

(define-struct box [width height])
; Box is (make-box Number Number)
; interp. represents a box
; box-width : (Box -> Number)
; box-height : (Box -> Number)

(define bx-20-30 (make-box 20 30))

; box-temp : (Box -> ???)
(define (box-temp bx)
  (... (box-width bx) (box-height bx)))

; union Shape is one of:
; - (make-disc Number)
; - (make-box Number Number)
; interp. a set of shapes

; shape-temp : (Shape -> ???)
(define (shape-temp sh)
  (cond
    [(disc? sh)
     (... (disc-radius sh))]
    [(box? sh)
     (... (box-width sh) (box-height sh))]))

; =================
#| Functions:
1. Signature, purpose, stub ❌
2. Examples (aka check-expect/tests, elaborate the concrete) ❌
3. Template(from data)?❌
3. Code body ❌
4. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
|#

; grow-shape: (Shape -> Shape)
; produces the shape but with its dimmensions increased
(check-expect (grow-shape ds-30) (make-disc 31))
(check-expect (grow-shape bx-20-30) (make-box 21 31))
; (define (grow-shape sh) sh)
(define (grow-shape sh)
  (cond
    [(disc? sh)
     (make-disc (+ 1 (disc-radius sh)))]
    [(box? sh)
     (make-box (+ 1 (box-width sh)) (+ 1 (box-height sh)))]))

; shape->image : (Shape -> Image)
; produces the drawing of the given shape
(check-expect (shape->image ds-30)
              (circle 30 "solid" "red"))
(check-expect (shape->image bx-20-30)
              (rectangle 20 30 "solid" "black"))
; (define (shape-image sh) empty-image)
(define (shape->image sh)
  (cond
    [(disc? sh)
     (circle (disc-radius sh) "solid" "red")]
    [(box? sh)
     (rectangle (box-width sh) (box-height sh) "solid" "black")]))

; render: (Shape -> Image)
; draws the image of a shape on a background
(check-expect (render ds-30)
              (place-image
               (shape->image ds-30)
               HALF-WIDTH HALF-HEIGHT BACKGROUND))
(check-expect (render bx-20-30)
              (place-image
               (shape->image bx-20-30)
               HALF-WIDTH HALF-HEIGHT BACKGROUND))
; (define (render sh) empty-image)
(define (render sh)
  (place-image
   (shape->image sh)
   HALF-WIDTH
   HALF-HEIGHT
   BACKGROUND))

; flip-shape : (Shape -> Shape)
; if the given shape is a disc, flip it to a box and vice versa
(check-expect (flip-shape ds-30) (make-box 30 30))
(check-expect (flip-shape (make-box 30 30)) ds-30)
; (define (flip-shape sh) sh)
(define (flip-shape sh)
  (cond
    [(disc? sh)
     (make-box (disc-radius sh) (disc-radius sh))]
    [(box? sh)
     (make-disc (box-width sh))]))

; handle-key: (Shape KeyEvent -> Shape)
; when the space key is pressed, produce change the shape from box to disc and vice versa
(check-expect (handle-key (make-box 30 30) " ")
              ds-30)
(check-expect (handle-key ds-30 " ")
              (make-box 30 30))
(check-expect (handle-key ds-30 "a")
              ds-30)

(define (handle-key sh ke)
  (cond [(key=? ke " ")
         (flip-shape sh)]
        [else
         sh]))

; main: (Shape -> Shape)
; start the world with (main (make-disc 0))
(define (main sh)
  (big-bang sh           ; Shape
    [on-key    handle-key]      ; Shape KeyEvent -> Shape
    [on-tick   grow-shape]     ; Shape -> Shape
    [to-draw   render]   ; Shape -> Image
    ))