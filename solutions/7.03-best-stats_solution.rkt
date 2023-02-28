;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 7.03-best-status_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'best-stats)
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
    2. Examples (aka check-expect, elaborate the concrete) ✅
    3. Template(from data)?✅
    3. Code body ✅
    4. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#

#|PROBLEM A:
Design a data definition to model properties of an item in a video game. Name your data 'item'.

|   name   | attack | defense | price|
|----------|--------|---------|------|
| "spear"  |     10 |      20 |   31 |
| "sword"  |     20 |       5 |   43 |
| "sheild" |      5 |      40 |   25 |
| "dagger" |      5 |       5 |   10 |
| "knife"  |      5 |       5 |   5  |
|#

(define-struct item [name attack defense price])
; Item is (make-item String Natural Natural Natural)
; interp. an item in a video game, 
; attack increases how heavy you hit
; defense increases damage blocked
; price is how much in gold pieces

; item-name: (Item -> String)
; item-attack: (Item -> Natural)
; item-defense: (Item -> Natural)
; item-cost: (Item -> Natural)
; item?: (Any -> Boolean)

(define spear (make-item "spear" 10 20 31))
(define knife (make-item "knife" 5 5 5))
(define dagger (make-item "dagger" 5 5 10))

(define (item-temp it)
  (... (item-name it)
       (item-attack it)
       (item-defense it)
       (item-price it)))

#|PROBLEM B:
Design a function 'best-stats' that produces the name of the item with the most COMBINED stats
Combined stat should only include attack and defense points. 
If equal, produce the name of the second given item
|#

; best-stats: (Item Item -> String)
; produce name of the item with the most combined stat points of the two.
(check-expect (best-stats spear knife) "spear")
(check-expect (best-stats knife spear) "spear")
(check-expect (best-stats knife dagger) "dagger")

; (define (best-stats it it2) "")

; template
#;
(define (best-stats it it2)
  (... (item-name it)
       (item-attack it)
       (item-defense it)
       (item-price it)
         
       (item-name it2)
       (item-attack it2)
       (item-defense it2)
       (item-price it2)))

; note: factoring this into a 'sum-stats' function can make things look/read nicer
(define (best-stats it it2)
  (if (> (+ (item-attack it)
            (item-defense it))
         (+ (item-attack it2)
            (item-defense it2)))
      (item-name it)
      (item-name it2)))