;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 18.01-grocery_starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'grocery)
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

; ############################################################################

(define-struct grocery [name price stock])
; Grocery is (make-grocery String Number Number)
; name is the name of the item
; price is cost in dollars
; stock is the number available
(define chips (make-grocery "chips" 1.00 1))
(define tomato (make-grocery "tomato" 1.00 2))
(define lettuce (make-grocery "lettuce" 2.00 5))
(define cheese (make-grocery "cheese" 3.00 4))

; grocery-temp : (Grocery -> ???)
(define (grocery-temp grc)
  (...
   (grocery-name grc)
   (grocery-price grc)
   (grocery-stock grc)))

; ListOfGrocery is one of: 
; - empty
; - (cons Grocery ListOfGrocery)
(define all-groceries (list tomato lettuce cheese chips))

#|PROBLEM A:
Finish the template for ListOfGrocery
|#
; list-grocery-temp : (ListOfGrocery -> ???)
; TODO: TEMPLATE

#|PROBLEM B:
Design a function "total-prices" that consumes a ListOfGrocery and
produces the total price of all groceries in list
|#

#|PROBLEM C:
Design a function "filter-price" that consumes a ListOfGrocery and a price and
produces all groceries equal to or under the given price
|#

#|PROBLEM D:
Design a function "restock" that consumes a ListOfGrocery and a Number and
produces the list of groceries with the stocks increased by the given Number
|#