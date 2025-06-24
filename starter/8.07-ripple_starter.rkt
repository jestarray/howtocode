;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 8.07-ripple_starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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
2. Examples (aka check-expect, elaborate the concrete)❌
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
