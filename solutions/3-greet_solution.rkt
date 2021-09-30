#| PROBLEM 3: 
Write a function named "greet" that consumes a person and produces string for each person:
"Hi my name is edward norton, I am 18 old and single, my balance is 99"
"Hi my name is marla singer, I am 24 old and taken, my balance is 55"
"Hi my name is tyler durden, I am 18 old and taken, my balance is 0"
|#

(define-struct person (fn ln age balance single))

(define p1 (make-person "edward" "norton" 18 99 #true))
(define p2 (make-person "marla" "singer" 24 55 #false))
(define p3 (make-person "tyler" "durden" 18 0 #false))

;; Person -> String
;; produces a greeting given a person
(define (greet pr)
    (string-append "Hi my name is " (person-fn pr) " " (person-ln pr) ", I am " (number->string (person-age pr)) " old and "
    (if (person-single pr) "single" "taken") ", my balance is " (number->string (person-balance pr))))

(greet p1)
(greet p2)
(greet p3)