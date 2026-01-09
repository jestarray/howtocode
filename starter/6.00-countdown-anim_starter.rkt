;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6.00-countdown-anim_starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'countdown-anim)
(require 2htdp/image)
(require 2htdp/universe)

#| PROBLEM A:
Design a world program that represents a countdown from [10, 0]. The program should 
display the number of seconds remaining and should decrease at each 
clock tick. Upon reaching zero, it should stay there and not change.

To make your countdown progress at a reasonable speed, you can use the 
rate option to on-tick. If you say, for example,
[on-tick advance-countdown 1] then big-bang will wait 1 second between 
calls to advance-countdown.

Remember to follow the HtDW recipe! Be sure to do a proper domain 
analysis before starting to work on the code file.
|#

#| PROBLEM B:
Upon finishing PROBLEM A, make it so the program 
resets the countdown to 10 when you press the r key.
Call your function handle-key
|#


; My world program does ... (make this more specific)

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
; WorldState is ... (give WorldState a better name)



; =================
#| Functions:
1. Signature, purpose, stub ❌
2. Examples (aka check-expect, elaborate the concrete) ❌
3. Template(from data)?❌
4. Code body ❌
5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
|#

; ############################################################################

; main: (WorldState -> WorldState)
; start the world with ...
; 
(define (main ws)
  (big-bang ws                   ; WorldState
    [on-mouse  ...]      ; WorldState Integer Integer MouseEvent -> WorldState
    [on-key    ...]      ; WorldState KeyEvent -> WorldState
    [on-tick   update-cd]     ; WorldState -> WorldState
    [to-draw   render]   ; WorldState -> Image
    [stop-when ...]      ; WorldState -> Boolean
    ))


; update-cd: (WorldState -> WorldState)
; produce the next ...
; TODO!
(define (update-cd ws) ...)


; render: (WorldState -> Image)
; render ... 
; TODO!
(define (render ws) ...)