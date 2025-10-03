;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 18.03-ginventory_starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'ginventory)
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
    4. A function template that processes this data❌
== Functions ==
    1. Signature, purpose, stub ❌
    2. Examples (aka check-expect/tests, elaborate the concrete) ❌
      2B. if the function consumes a list, make sure a list of 2 or longer is tested ❌
    3. Template(from data)?❌
    4. Code body ❌
    5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
|#

; Class is one of:
; - "knight"
; - "mage"

(define-struct item [name class level attack defense price])
; Item is (make-item String Class Number Number Number Number)
; - name is the name of the item
; - class is who can wield this item
; - attack is the damage to dealt
; - defense is the damage to block
; - price is the cost of the item
(define sword      (make-item "sword"      "knight" 1 10 3 44))
(define long-sword (make-item "long sword" "knight" 5 20 10 90))

(define wand  (make-item "wand" "mage" 1 15 3 54))
(define staff (make-item "staff" "mage" 5 35 5 98))

; item-temp : (Item -> ???)
(define (item-temp itm)
  (... (item-name itm)
       (item-class itm)
       (item-level itm)
       (item-attack itm)
       (item-defense itm)
       (item-price itm)))

; ListOfItem is one of:
; - empty
; - (cons Item ListOfItem)
(define all-items (list sword long-sword wand staff))

#|PROBLEM A:
Finish the template for ListOfItem
|#

; list-item-temp : (ListOfItem -> ???)
; TODO: TEMPLATE

#|PROBLEM B:
Design a function "total-price" that consumes a ListOfItem and
produces the total price of all the items in the list
|#

#|PROBLEM C:
Design a function "filter-class" that consumes a ListOfItem and a Class and
produces only the Items with the given class
|#

#|PROBLEM D:
Design a function "raise-all-prices" that consumes a ListOfItem and a Number and
produces a ListOfItem with all the items prices increased by the given Number
|#