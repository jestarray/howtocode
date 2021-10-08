; PROBLEM BUGGY 2
; there is a bug in this program, a user is trying to login:

(check-expect (login "Bob123") "sucessful login")
(check-expect (login "bob123") "sucessful login")
(check-expect (login "alice137") "user not found")

; ONLY CHANGE CODE BELOW THIS LINE

(define (login user)
    (if (string=? user "bob123")
        "sucessful login"
        "user not found"))