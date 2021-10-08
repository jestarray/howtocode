; PROBLEM BUGGY 4: THERE IS A BUG IN THIS CODE:
(check-expect (18-or-older? 4) #false)
(check-expect (18-or-older? 17) #false)
(check-expect (18-or-older? 18) #true)
(check-expect (18-or-older? 19) #true)
(check-expect (18-or-older? 22) #true)

; ONLY CHANGE CODE BELOW THIS LINE

(define (18-or-older? age)
    (> age 18))