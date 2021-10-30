;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname buggy_logic2_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; PROBLEM BUGGY 2
; there is a bug in this program, a user is trying to login:

(check-expect (login "Bob123") "sucessful login")
(check-expect (login "bob123") "sucessful login")
(check-expect (login "alice137") "user not found")

; ONLY CHANGE CODE BELOW THIS LINE

(define (login user)
    (if (string=? (string-lowercase user) "bob123")
        "sucessful login"
        "user not found"))