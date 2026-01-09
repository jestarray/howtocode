;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6.00-countdown-anim_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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

; Animates the given number counting down resetting with R

; =================
; CONSTANTS:
(define WIDTH 300)
(define HEIGHT 300)
(define TEXT-SIZE 196)
(define BG (empty-scene WIDTH HEIGHT))
(define CENTER-X (/ WIDTH 2))
(define CENTER-Y (/ HEIGHT 2))
(define TEXT-COLOR "black")


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

; Countdown is a Number
; interp. measures time in seconds till zero
(define END 0)

(define (countdown-temp cd)
  (... 0))


; =================
#| Functions:
1. Signature, purpose, stub ✅
2. Examples (aka check-expect, elaborate the concrete) ✅
3. Template(from data)?✅
4. Code body ✅
5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#

; ############################################################################

; main: (Countdown -> Countdown)
; start the world with (main 10)
(define (main ws)
  (big-bang ws           ; Countdown
    [on-key    handle-key] ; Countdown KeyEvent -> Countdown
    [on-tick   update-cd 1]; Countdown -> Countdown
    [to-draw   render]   ; Countdown Integer Integer MouseEvent -> Countdown
    ))

; update-cd: (Countdown -> Countdown)
; produce the given countdown decremented except zero stays the same
(check-expect (update-cd 10) 9)
(check-expect (update-cd 5) 4)
(check-expect (update-cd 1) 0)
(check-expect (update-cd 0) 0)

(define (update-cd cd)
  (if (= cd 0)
      0
      (sub1 cd)))

; render: (Countdown -> Image)
; produce the image of the countdown
(check-expect (render 10)
              (place-image
               (text "10" TEXT-SIZE TEXT-COLOR)
               CENTER-X
               CENTER-Y
               BG))

(check-expect (render 4)
              (place-image
               (text "4" TEXT-SIZE TEXT-COLOR)
               CENTER-X
               CENTER-Y
               BG))

(define (render cd)
  (place-image
   (text (number->string cd) TEXT-SIZE TEXT-COLOR)
   CENTER-X
   CENTER-Y
   BG))

; handle-key: (Countdown KeyEvent -> Countdown)
; resets the countdown to 10 when R is pressed
(check-expect (handle-key 10 "r") 10)
(check-expect (handle-key 0 "r") 10)
(check-expect (handle-key 3 "x") 3)

(define (handle-key cd ke)
  (cond
    [(key=? ke "r") 10]
    [else cd]))