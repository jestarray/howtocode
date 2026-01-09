;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 18.01-grocery_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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
    4. A function template that processes this data✅
== Functions ==
    1. Signature, purpose, stub ✅
    2. Examples (aka check-expect/tests, elaborate the concrete) ✅
      2B. if the function consumes a list, make sure a list of 2 or longer is tested ✅
    3. Template(from data)?✅
    4. Code body ✅
    5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
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
(define (list-grocery-temp grc-ls)
  (cond
    [(empty? grc-ls) ...]
    [else
     (... (first grc-ls)
          (list-grocery-temp (rest grc-ls)))]))

#|PROBLEM B:
Design a function "total-prices" that consumes a ListOfGrocery and
produces the total price of all groceries in list
|#
(check-expect (total-price all-groceries) (+ 1 1 2 3))
(define (total-price grc-ls)
  (cond
    [(empty? grc-ls) 0]
    [else
     (+ (grocery-price (first grc-ls))
        (total-price (rest grc-ls)))]))

#|PROBLEM C:
Design a function "filter-price" that consumes a ListOfGrocery and a price and
produces all groceries equal to or under the given price
|#
(check-expect (filter-price all-groceries 2.0)
              (list tomato lettuce chips))
(define (filter-price grc-ls threshold)
  (cond
    [(empty? grc-ls) empty]
    [else
     (if (<= (grocery-price (first grc-ls)) threshold)
         (cons (first grc-ls) (filter-price (rest grc-ls) threshold))
         (filter-price (rest grc-ls) threshold))]))

#|PROBLEM D:
Design a function "restock" that consumes a ListOfGrocery and a Number and
produces the list of groceries with the stocks increased by the given Number
|#
; restock : (ListOfGrocery Number -> ListOfGrocery)
; produces the list of groceries with the stocks increased by the given Number
(check-expect (restock (list chips) 1)
              (list (up-stock chips 1)))
(check-expect (restock (list chips tomato) 1)
              (list (up-stock chips 1)
                    (up-stock tomato 1)))
(define (restock grc-ls inc)
  (cond
    [(empty? grc-ls) empty]
    [else
     (cons
      (up-stock (first grc-ls) inc)
      (restock (rest grc-ls) inc))]))

; up-stock : (Grocery Number -> Grocery)
; produce the given grocery with the stock increased by the given amount
(check-expect (up-stock chips 1)
              (make-grocery "chips" 1.00 2))
(define (up-stock grc inc)
  (make-grocery
   (grocery-name grc)
   (grocery-price grc)
   (+ (grocery-stock grc) inc)))