; PROBLEM BUGGY 3: THERE IS A BUG IN THIS CODE
(check-expect (area 4 4) 16)
(check-expect (area 2 4) 8)

; ONLY CHANGE CODE BELOW THIS LINE

(define (area w h)
    (* w w))