;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 19.01-multi-ripple_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'multi-ripple)

(require 2htdp/image)
(require 2htdp/universe)

; =================
; CONSTANTS:
(define WIDTH 400)
(define HEIGHT 400)
(define REMOVAL-SIZE (* WIDTH HEIGHT 2))
(define BG (empty-scene WIDTH HEIGHT "blue"))
(define RIPPLE-GROWTH 4)

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
(define-struct ripple [x y radius])
; Ripple is (make-ripple Number Number Number)
; - x & y is the centerpoint of where the ripple spawns
; - radius is how big the ripple is

(define r0 (make-ripple 0 0 4))

(define (ripple-temp rp)
  (...
   (ripple-x rp)
   (ripple-y rp)
   (ripple-radius rp)))

; ListOfRipple is one of:
; - empty
; (cons Ripple ListOfRipple)

(define ls-ripples
  (list (make-ripple 0 4 4)
        (make-ripple 200 100 10)
        (make-ripple 200 200 25)))

; list-of-ripple-temp : (ListOfRipple -> ???)
(define (list-of-ripple-temp rpl-ls)
  (cond
    [(empty? rpl-ls) ...]
    [else
     (... (ripple-temp (first rpl-ls))
          (list-of-ripple-temp (rest rpl-ls)))]))

; =================
#| Functions:
1. Signature, purpose, stub ✅
2. Examples (aka check-expect, elaborate the concrete)✅
3. Template(from data)?✅
3. Code body ✅
4. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#

#| PROBLEM A:
Expanding on the Ripple program from 8.07, where a click spawns an expanding circle,
https://howtocode.pages.dev/images/ripple.png

Difficulty challenge(optional): Copy & modify 8.07-ripple file and replace the WorldState
with a "ListOfRipple" and expand the code from there.
Or you can just continue working on this file instead, which is esaier since the tasks are laid out

The following functions are done for you cause being carried over from 8.07-ripple
✅grow-ripple
✅draw-ripple

Follow the design process and finish the functions:
✅grow-all-ripple
✅draw-all-ripple
✅handle-mouse

|#

; grow-ripple : (Ripple-> Ripple)
; produce a ripple that grows in radius
(check-expect (grow-ripple (make-ripple 0 0 2))
              (make-ripple 0 0 (+ 2 RIPPLE-GROWTH)))
(define (grow-ripple ws)
  (make-ripple
   (ripple-x ws)
   (ripple-y ws)
   (+ (ripple-radius ws) RIPPLE-GROWTH)))

; grow-all-ripple : (ListOfRipple -> ListOfRipple)
; grows every ripple in the given list
; and removes those that are too big and out of view(bonus: can be done WAY last)
(check-expect (grow-all-ripple empty) empty)
(check-expect (grow-all-ripple (list (make-ripple 40 50 REMOVAL-SIZE)))
              empty)
(check-expect (grow-all-ripple (list (make-ripple 40 50 6)))
              (list (grow-ripple (make-ripple 40 50 6))))
(check-expect (grow-all-ripple (list (make-ripple 40 50 6)
                                      (make-ripple 30 20 2)))
              (list (grow-ripple (make-ripple 40 50 6))
                    (grow-ripple (make-ripple 30 20 2))))
(define (grow-all-ripple rpl-ls)
  (cond
    [(empty? rpl-ls) empty]
    [(>= (* pi (expt (ripple-radius (first rpl-ls)) 2)) REMOVAL-SIZE)
     (grow-all-ripple (rest rpl-ls))]
    [else
     (cons (grow-ripple (first rpl-ls))
           (grow-all-ripple (rest rpl-ls)))]))

; draw-ripple : (Ripple -> Image)
; draws a single ripple on the given BG
(check-expect (draw-ripple (make-ripple 30 20 25) BG)
              (place-image
               (circle 25 "outline" "white")
               30
               20
               BG))

(define (draw-ripple rp bg)
  (place-image
   (circle (ripple-radius rp) "outline" "white")
   (ripple-x rp)
   (ripple-y rp)
   bg))

; draw-all-ripple : (ListOfRipple -> Image)
; draws all ripples on the given background image
(check-expect (draw-all-ripple empty) BG)
(check-expect (draw-all-ripple (list (make-ripple 20 30 2)))
              (draw-ripple (make-ripple 20 30 2) BG))
(check-expect (draw-all-ripple (list (make-ripple 20 30 2) (make-ripple 40 50 9)))
              (draw-ripple (make-ripple 20 30 2)
                           (draw-ripple (make-ripple 40 50 9) BG)))
(define (draw-all-ripple rpl-ls)
  (cond
    [(empty? rpl-ls) BG]
    [else
     (draw-ripple (first rpl-ls)
                  (draw-all-ripple (rest rpl-ls)))]))

; click-add : (ListOfRipple Number Number MouseEvent -> ListOfRipple)
; produce the ripple at where the mouse is if user clicked
(check-expect (click-add (list (make-ripple 1 2 3)) 32 42 "button-down")
              (list (make-ripple 32 42 0) (make-ripple 1 2 3)))
(check-expect (click-add (list (make-ripple 1 2 3)) 32 42 "drag")
              (list (make-ripple 1 2 3)))

(define (click-add rpl-ls mousex mousey me)
  (cond
    [(mouse=? me "button-down")
     (cons (make-ripple mousex mousey 0) rpl-ls)]
    [else
     rpl-ls]))

; main: (ListOfRipple -> ListOfRipple)
; start the world with (main empty)
(define (main ws)
  (big-bang ws                   ; ListOfRipple
    [on-mouse  click-add]      ; ListOfRipple Integer Integer MouseEvent -> ListOfRipple
    [on-tick   grow-all-ripple]     ; ListOfRipple -> ListOfRipple
    [to-draw   draw-all-ripple]   ; ListOfRipple -> Image
    ))

; (main empty)