#lang pollen

◊h1{Checked Signatures}

◊h2{Checked Signature Cheatsheet}
Find more types in the ◊a[#:href "https://docs.racket-lang.org/htdp-langs/intermediate.html#%28part._intermediate-signatures%29"]{Racket Documentation}
◊racket-code-block{
; === ENUMERATIONS ===
; Rank is one of:
; - "Bronze"
; - "Silver"
; - "Gold"
; - "Platinum"
; - "Diamond"
(define Rank
  (signature (enum "Bronze" "Silver" "Gold" "Platinum" "Diamond")))

(: demote (Rank -> Rank))
; produces the next rank below it, bronze will stay bronze
(check-expect (demote "Diamond") "Platinum")
(check-expect (demote "Platinum") "Gold")
(check-expect (demote "Gold") "Silver")
(check-expect (demote "Silver") "Bronze")
(check-expect (demote "Bronze") "Bronze")
(define (demote r)
  (cond
    [(string=? r "Bronze") "Bronze"]
    [(string=? r "Silver") "Bronze"]
    [(string=? r "Gold") "Silver"]
    [(string=? r "Platinum") "Gold"]
    [(string=? r "Diamond") "Platinum"]))

; === Unions/Itemization(Mixed data) ===
; A WalkLight is one of:
; Number[0, 10]
; "walk"
; "stop"
(define WalkLight (signature (mixed Number (enum "walk" "stop"))))
(: can-walk? (WalkLight -> Boolean))
; produces #true if given "walk" or in countdown
(define (can-walk? wl)
  (cond
    [(and (number? wl) (>= wl 0) (<= wl 10)) #true]
    [(string=? wl "walk") #true]
    [(string=? wl "stop") #false]))

; === Structs ===
(define-struct employee [name age wage])
(define EmployeeSig (signature (Employee String Number Number)))
(: increase-wage (Employee Number -> Employee))
(check-expect (increase-wage (make-employee "bob" 20 15) 2)
              (make-employee "bob" 20 (+ 15 2)))
(define (increase-wage ps n)
  (make-employee
   (employee-name ps)
   (employee-age ps)
   (+ n (employee-wage ps))))

; === Lists ===
(: double-all ((ListOf Number) -> (ListOf Number)))
; produces the given list but with all numbers doubled!
(check-expect (double-all (list 1 2 3)) (list 2 4 6))
(define (double-all num-ls)
  (cond
    [(empty? num-ls) empty]
    [else
     (cons (* 2 (first num-ls))
           (double-all (rest num-ls)))]))

; === ListOf Structs ===
(: raise-all-wages ((ListOf Employee) Number -> (ListOf Employee)))
; produce the given list of employees with the wage increased by N
(check-expect (raise-all-wages (list (make-employee "bob" 20 15)) 2)
              (list (make-employee "bob" 20 (+ 15 2))))
(define (raise-all-wages psn-ls n)
  (cond
    [(empty? psn-ls) empty]
    [else
     (cons
      (increase-wage (first psn-ls) n)
      (raise-all-wages (rest psn-ls) n))]))
}