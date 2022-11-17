;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 5.01-next-light_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(define PNAME 'next-light)
#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete
== Data ==
    1. Data Description✅
    2. Interpretation✅
    3. Data Examples✅
    4. A function template that processes this data✅
== Functions ==
    1. Signature, purpose, stub ✅
    2. Examples (aka check-expect, elaborate the concrete) ✅
    3. Template(from data)?✅
    3. Code body ✅
    4. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#

#|PROBLEM A:
Notice how the "TrafficLight" data definition below uses mixed types of data,
nameley a Boolean and String.

Finish writing the template for "TrafficLight"
|#

; A TrafficLight is one of:
; - #false
; - "red"
; - "yellow"
; - "green"
; interp. 
; #false         means off
; <rest means the color of the light>

(define OFF #false)
(define RED "red")
(define YELLOW "yellow")
(define GREEN "green")

(define (trafficlight-temp tl)
  (cond
    [(and (boolean? tl) (boolean=? tl #false)) ...]
    [(and (string? tl) (string=? tl RED)) (... tl)]
    [(and (string? tl) (string=? tl YELLOW)) (... tl)]
    [(and (string? tl) (string=? tl GREEN)) (... tl)]))

#|PROBLEM B:
Notice how some steps of the design recipe has been done
for "next-light". Finish the function
|#

; next-light : (TrafficLight -> TrafficLight)
; produces the next light with the given rules:
; red turns to green
; green turns to yellow
; yellow turns to red
; #false stays the same

(check-expect (next-light #false) #false)
(check-expect (next-light RED) GREEN)
(check-expect (next-light YELLOW) RED)
(check-expect (next-light GREEN) YELLOW)

(define (next-light tl)
  (cond
    [(and (boolean? tl) (boolean=? tl #false)) #false]
    [(and (string? tl) (string=? tl RED)) GREEN]
    [(and (string? tl) (string=? tl YELLOW)) RED]
    [(and (string? tl) (string=? tl GREEN)) YELLOW]))

(define (next-light-OPT tl)
  (cond
    [(boolean? tl) #false]
    [(string=? tl RED) GREEN]
    [(string=? tl YELLOW) RED]
    [(string=? tl GREEN) YELLOW]))