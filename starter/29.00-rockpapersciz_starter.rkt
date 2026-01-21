#lang htdp/isl+
(define PNAME 'rockpapersciz)
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

Functions:
1. Signature, purpose, stub ❌
2. Examples (aka check-expect/tests, elaborate the concrete) ❌
  2B. if the function consumes a list, make sure a list of 2 or longer is tested❌
3. Template(from data)?❌
4. Code body ❌
5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
|#

; ############################################################################

#|PROBLEM A:
Design the function "rps-tournament" that consumes
2 lists. Each list represents the moves of two players in the game.
Each item in the list represents the move they made that round.
Produce 1 if player1 wins, -1 if player2 wins, and 0 for a draw
For example:
(rps-tournament (list "scissors") 
                (list "scissors"))
produces
(list 0)

(rps-tournament (list "rock"  "scissors"    "rock") 
                (list "paper" "paper" "rock"))
produces:
(list -1 1 0) ; player2 wins, player1 wins, draw

This requires traversing both lists at every recursive call!
You should assume both lists start off with the same length
|#

; RPS is one of:
; - "rock"
; - "paper"
; - "scissors"

(: rps-tournament ([ListOf String] [ListOf String] -> [ListOf Number]))
; produces the numbers coresponding to who won in rock paper scissors
(define (rps-tournament set1 set2) empty)