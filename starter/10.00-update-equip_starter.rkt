;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 10.00-update-equip_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'update-equip)

#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete
== Data ==
    1. Data Description✅✅
        1B. if using define-struct, write all accessor signatures❌❌
    2. Interpretation✅✅
    3. Data Examples❌❌
    4. A function template that processes this data❌❌
== Functions ==
    1. Signature, purpose, stub ❌
    2. Examples (aka check-expect/tests, elaborate the concrete) ❌
    3. Template(from data)?❌
    4. Code body ❌
    5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
|#

; ############################################################################

#|PROBLEM A:
Finish the uncompleted steps ❌ of Data Design above for Wep and Player
|#

; Class is one of:
; - "Knight"
; - "Mage"
; interp. the type of character in a video game

(define-struct wep [name class damage])
; Wep is (make-wep String String Number)
; interp.
; name is the name of the weapon
; class is the name of what type of character that can wield this wep
; damage is the number of hp it deals


(define-struct player [name equip])
; Player is (make-player String Wep)
; interp.
; name is the name of the player
; equip is a reference to Wep, the current item that the player is wielding


#|PROBLEM B:
In video games, players can only equip a wep that is of their same class.
If a Mage tries to equip a sword, the game would not let them and their equip would remain the same.
Let's also prevent the player from down equiping their weapon by making it so they will always equip the weapon with the most damage

Design the "update-equip" that takes a Player and a Wep, and produces a Player that fullfills the mechanics above
|#

