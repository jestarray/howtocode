; PROBLEM BUGGY 1: 
; there is a bug in this program, get all the tests to pass

(check-expect (is-dead? 4) #false)
(check-expect (is-dead? 0) #true)
(check-expect (is-dead? -1) #true)

; ONLY CHANGE CODE BELOW THIS LINE

(define (is-dead? hp)
    (<= hp 0))
