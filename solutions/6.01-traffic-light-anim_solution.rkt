;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6.01-traffic-light-anim_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'traffic-light-anim)
(require 2htdp/image)
(require 2htdp/universe)

#| PROBLEM A:
Design an animation of a traffic light 🚦. 

Your program should show a traffic light that is red, then green, 
then yellow, then red etc. For this program, your changing world 
state data definition should be an enumeration.

We have done part of this problem in 4.01 but try and do it all over here.
Use the strings "red", "yellow" and "green" to represent the WorldState.

The images of traffic lights have been provided as constants below.

Remember to follow the HtDW recipe! Be sure to do a proper domain 
analysis before starting to work on the code file.
|#

#| OPTIONAL CHALLENGE PROBLEM B:
Upon finishing PROBLEM A, design a 'handle-key' function that will also advance
the state of the traffic light upon pressing the 'n' key
|#


; Animates a traffic light going from red to green to yellow then back to red

; =================
; CONSTANTS:

(define RADIUS 20) ; of each light

(define BACKGROUND (rectangle (* 2.5 RADIUS)
                              (* 6.5 RADIUS)
                              "solid"
                              "black"))

(define RED-LIGHT
  (overlay (above 
            (circle RADIUS "solid"   "red")
            (circle RADIUS "outline" "yellow")
            (circle RADIUS "outline" "green")
            )
           BACKGROUND))

(define YELLOW-LIGHT
  (overlay (above 
            (circle RADIUS "outline" "red")
            (circle RADIUS "solid"   "yellow")
            (circle RADIUS "outline" "green")
            )
           BACKGROUND))

(define GREEN-LIGHT
  (overlay (above 
            (circle RADIUS "outline" "red")
            (circle RADIUS "outline" "yellow")
            (circle RADIUS "solid"   "green")
            )
           BACKGROUND))

; =================
#| Data definitions:
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/5Zq8sH5
Turn all ❌ into ✅ for each step you complete

0. Data Description✅
1. Interpretation✅
2. Data Examples✅
3. A function template that processes this data✅
|#

; A TrafficLight is one of:
; - "red"
; - "yellow"
; - "green"
; interp. 
; <rest means the color of the light>

(define (trafficlight-temp tl)
  (cond
    [(and (string? tl) (string=? tl "red")) (... tl)]
    [(and (string? tl) (string=? tl "yellow")) (... tl)]
    [(and (string? tl) (string=? tl "green")) (... tl)]))

; =================
#| Functions:
0. Signature, purpose, stub ✅
1. Examples (aka check-expect, elaborate the concrete) ✅
2. Template(from data)?✅
2. Code body ✅
3. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#

; main: (TrafficLight -> TrafficLight)
; start the world with ...
; 
(define (main tl)
  (big-bang tl ; TrafficLight
    [on-key    handle-key]      ; TrafficLight KeyEvent -> TrafficLight
    [on-tick   next-light 1]     ; TrafficLight -> TrafficLight
    [to-draw   render]   ; TrafficLight -> Image
    ))

; next-light : (TrafficLight -> TrafficLight)
; produces the next light with the given rules:
; red turns to green
; green turns to yellow
; yellow turns to red

(check-expect (next-light "red") "green")
(check-expect (next-light "yellow") "red")
(check-expect (next-light "green") "yellow")

(define (next-light tl)
  (cond
    [(string=? tl "red") "green"]
    [(string=? tl "yellow") "red"]
    [(string=? tl "green") "yellow"]))

; render: (TrafficLight -> Image)
; produce the corresponding image for the given traffic light
(check-expect (render "red")    RED-LIGHT)
(check-expect (render "yellow") YELLOW-LIGHT)
(check-expect (render "green")  GREEN-LIGHT)

(define (render tl)
  (cond [(string=? tl "red")    RED-LIGHT]
        [(string=? tl "yellow") YELLOW-LIGHT]
        [(string=? tl "green")  GREEN-LIGHT]))


; handle-key: (TrafficLight KeyEvent -> TrafficLight)
; produce the next traffic light upon pressing N
(check-expect (handle-key "red" "n") "green")
(check-expect (handle-key "yellow" "n") "red")
(check-expect (handle-key "green" "n") "yellow")

(check-expect (handle-key "red" "x") "red")
(check-expect (handle-key "yellow" "x") "yellow")
(check-expect (handle-key "green" "x") "green")

(define (handle-key tl ke)
  (if (key=? ke "n")
      (next-light tl)
      tl))