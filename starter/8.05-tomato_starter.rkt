;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 8.05-tomato_starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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
(define TOMATO-IMG (text "🍅" 40 "red"))

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

; main: (WS -> WS)
; start the world with ...
; 
(define (main ws)
  (big-bang ws                   ; WS
            [on-mouse  ...]      ; WS Integer Integer MouseEvent -> WS
            [on-key    ...]      ; WS KeyEvent -> WS
            [on-tick   tock]     ; WS -> WS
            [to-draw   render]   ; WS -> Image
            [stop-when ...]      ; WS -> Boolean
))

; tock: (WS -> WS)
; produce the next ...
; TODO!
(define (tock ws) ...)


; render: (WS -> Image)
; render ... 
; TODO!
(define (render ws) ...)
