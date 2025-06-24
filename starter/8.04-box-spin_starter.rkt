;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 8.04-box-spin_starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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

; =================
#| Data definitions:
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete

1. Data Description❌
2. Interpretation❌
3. Data Examples❌
4. A function template that processes this data❌
|#


; =================
#| Functions:
1. Signature, purpose, stub ❌
2. Examples (aka check-expect, elaborate the concrete) ❌
3. Template(from data)?❌
3. Code body ❌
4. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
|#

; main: (WorldState -> WorldState)
; start the world with ...
; 
(define (main ws)
  (big-bang ws                   ; WorldState
    [on-mouse  ...]      ; WorldState Integer Integer MouseEvent -> WorldState
    [on-key    ...]      ; WorldState KeyEvent -> WorldState
    [on-tick   tock]     ; WorldState -> WorldState
    [to-draw   render]   ; WorldState -> Image
    [stop-when ...]      ; WorldState -> Boolean
    ))

; tock: (WorldState -> WorldState)
; produce the next ...
; TODO!
(define (tock ws) ...)


; render: (WorldState -> Image)
; render ... 
; TODO!
(define (render ws) ...)
