;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 12.00-flip-shape_starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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

; disc-temp: (Disc -> ???)
(define (disc-temp ds)
  (... (disc-radius ds)))

(define-struct box [width height])
; Box is (make-box Number Number)
; interp. represents a box
; box-width : (Box -> Number)
; box-height : (Box -> Number)

; box-temp : (Box -> ???)
(define (box-temp bx)
  (... (box-width bx) (box-height bx)))

; union Shape is one of:
; - (make-disc Number)
; - (make-box Number Number)
; interp. a set of shapes
; TODO: Data Design 3. Examples, 4. Template

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
(define (grow-shape sh) sh)
; TODO: Function Design

; shape->image : (Shape -> Image)
; produces the drawing of the given shape
; TODO: Function Design

; render: (Shape -> Image)
; draws the image of a shape on a background
(define (render sh) empty-image)
; TODO: Function Design

; flip-shape : (Shape -> Shape)
; if the given shape is a disc, flip it to a box and vice versa
; TODO: Function Design

; handle-key: (Shape KeyEvent -> Shape)
; when the space key is pressed, produce change the shape from box to disc and vice versa
; TODO: Function Design

; main: (Shape -> Shape)
; start the world with ...
(define (main sh)
  (big-bang sh           ; Shape
    ; [on-key    handle-key]      ; Shape KeyEvent -> Shape
    [on-tick   grow-shape]     ; Shape -> Shape
    [to-draw   render]   ; Shape -> Image
    ))