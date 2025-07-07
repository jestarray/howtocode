;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 8.10-typewriter_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'typewriter)

(require 2htdp/image)
(require 2htdp/universe)

#|PROBLEM A:
NPC Dialogue text in video games animates character by character. Google "game typewriter effect".
Design a world program that animates "typewriter effect".

HINT: We have provided you with the data definitions and constants.
Finish writing the "advance-char" and render function
|#


#|PROBLEM B:
Make it so when the user presses the "r" key, we will reset to the beginning. Follow HTDF for for "handle-key"
|#

; =================
; CONSTANTS:

(define WIDTH 600)
(define HEIGHT 30)
(define TEXT-SIZE 24)
(define TEXT-COLOR "black")
(define BACKGROUND (empty-scene WIDTH HEIGHT))

; =================
#| Data definitions:
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete

1. Data Description✅
   1B. if using define-struct, write all accessor signatures✅
2. Interpretation✅
3. Data Examples✅
4. A function template that processes this data✅
|#
(define-struct typewriter [message cursor])
; TypeWriter is (make-typewriter String Natural)
; interp.
; message is the string we want to display
; cursor is the index of the message we are displaying up

; typewriter-message : (TypeWriter -> String)
; typewriter-cursor: (TypeWriter -> Natural)

(define castle (make-typewriter "Thank you Mario! But our princess is in another castle!" 0))
(define cake (make-typewriter "the cake is a lie!" 2))

; typewriter-temp : (TypeWriter -> ???)
(define (typewriter-temp tw)
  (...
   (typewriter-message tw)
   (typewriter-cursor tw)))

; =================
#| Functions:
1. Signature, purpose, stub ✅
2. Examples (aka check-expect, elaborate the concrete) ✅
3. Template(from data)?✅
3. Code body ✅
4. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#

; advance-char : (TypeWriter -> TypeWriter)
; produce the next character of the typewriter text
(check-expect (advance-char castle)
              (make-typewriter (typewriter-message castle) 1))
(check-expect (advance-char cake)
              (make-typewriter (typewriter-message cake) 3))

; (define (advance-char ws) (make-typewriter "" 0))
(define (advance-char tw)
  (make-typewriter
   (typewriter-message tw)
   (if (< (typewriter-cursor tw)
          (string-length (typewriter-message tw)))
       (add1 (typewriter-cursor tw))
       (typewriter-cursor tw))
   ))

; render: (TypeWriter -> Image)
; draw the given text in typewriter piece wise based on the cursor
(check-expect 
 (render castle)
 (text 
  (substring (typewriter-message castle) 0 (typewriter-cursor castle)) 
  TEXT-SIZE 
  TEXT-COLOR))

; (define (render ws) empty-image)
(define (render tw)
  (overlay
   (text 
    (substring (typewriter-message tw) 0 (typewriter-cursor tw))
    TEXT-SIZE
    TEXT-COLOR)
   BACKGROUND))

; main: (TypeWriter -> TypeWriter)
; start the world with (main castle)
(define (main tw)
  (big-bang tw           ; TypeWriter
    [on-tick   advance-char 0.1]     ; TypeWriter -> TypeWriter
    [to-draw   render]   ; TypeWriter -> Image
    [on-key handle-key]
    ))

; handle-key: (TypeWriter KeyEvent -> TypeWriter)
; reset the typewriter cursor to 0 when the R key is pressed
(check-expect (handle-key castle "r") (make-typewriter (typewriter-message castle) 0))
(check-expect (handle-key castle "w") castle)
;(define (handle-key tw ke) (make-typewriter "" 0))
(define (handle-key tw ke)
  (cond [(key=? ke "r") 
         (make-typewriter (typewriter-message tw) 0)]
        [else
         tw]))

(main castle)