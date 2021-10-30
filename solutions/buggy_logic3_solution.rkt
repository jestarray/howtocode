;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname buggy_logic3_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; PROBLEM BUGGY 3: THERE IS A BUG IN THIS CODE
(check-expect (area 4 4) 16)
(check-expect (area 2 4) 8)

; ONLY CHANGE CODE BELOW THIS LINE

(define (area w h)
    (* w h))