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
    1. Data Description✅
        1B. if using define-struct, write all accessor signatures✅
    2. Interpretation✅
    3. Data Examples✅
    4. A function template that processes this data✅
== Functions ==
    1. Signature, purpose, stub ✅
    2. Examples (aka check-expect/tests, elaborate the concrete) ✅
    3. Template(from data)?✅
    3. Code body ✅
    4. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#

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

; wep-name : (Wep -> String)
; wep-class : (Wep -> String)
; wep-damage : (Wep -> Number)

(define sword (make-wep "Sword" "Knight" 10))
(define wand (make-wep "Wand" "Mage" 20))

(define long-sword (make-wep "Long-Sword" "Knight" 30))
(define staff (make-wep "Wizards Staff" "Mage" 50))

(define (wep-temp wp)
  (... (wep-name wp)
       (wep-class wp)
       (wep-damage wp)))

(define-struct player [name equip])
; Player is (make-player String Wep)
; interp.
; name is the name of the player
; equip is a reference to Wep, the current item that the player is wielding

; player-name : (Player -> String)
; player-equip : (Player -> Wep)

(define (player-temp ply)
  (... (player-name ply)
       (wep-temp (player-equip ply))))

(define harry-potter (make-player "Harry" wand))
(define samuari-jack (make-player "Jack" sword))

#|PROBLEM B:
In video games, players can only equip a wep that is of their same class.
If a Mage tries to equip a sword, the game would not let them and their equip would remain the same.
Let's also prevent the player from down equiping their weapon by making it so they will always equip the weapon with the most damage

Design the "update-equip" that takes a Player and a Wep, and produces a Player fullfills the mechanics above
|#

; update-equip: (Player Wep -> Player)
; replace the players equip field if the given weapon is of the same class as the player

(check-expect (update-equip harry-potter staff) (make-player "Harry" staff))
(check-expect (update-equip harry-potter sword) (make-player "Harry" wand))
(check-expect (update-equip samuari-jack sword) (make-player "Jack" sword))
;(define (update-equip ply wp) ply)

(define (update-equip ply wp)
  (make-player
   (player-name ply)
   (decide-wep (player-equip ply) wp)))

; decide-wep : (Wep Wep -> Wep)
; produces the 2nd given wep if it is of the same class 1st given weapon and is stronger
(define (decide-wep old new)
  (if 
   (and (string=? (wep-class old) (wep-class new))
        (< (wep-damage old) (wep-damage new)))
   new
   old))