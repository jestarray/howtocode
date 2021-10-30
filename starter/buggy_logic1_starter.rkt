;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname buggy_logic1_starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; PROBLEM BUGGY 1: 
; there is a bug in this program, get all the tests to pass

(check-expect (is-dead? 4) #false)
(check-expect (is-dead? 0) #true)
(check-expect (is-dead? -1) #true)

; ONLY CHANGE CODE BELOW THIS LINE

(define (is-dead? hp)
    (= hp 0))
