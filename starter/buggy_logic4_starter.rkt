;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname buggy_logic4_starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; PROBLEM BUGGY 4: THERE IS A BUG IN THIS CODE:
(check-expect (18-or-older? 4) #false)
(check-expect (18-or-older? 17) #false)
(check-expect (18-or-older? 18) #true)
(check-expect (18-or-older? 19) #true)
(check-expect (18-or-older? 22) #true)

; ONLY CHANGE CODE BELOW THIS LINE

(define (18-or-older? age)
    (> age 18))