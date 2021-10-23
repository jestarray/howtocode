;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname syntaxerror_starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; (<operator> <argument-1> <argument-2> ...)
; PROBLEM: each line of code contains errors try and fix em
; comment out line if you don't know how
; use the cheatsheet:
; https://howtocode.pages.dev/cheatsheet.html

(if (or (or #true #false) (and #true #false) (+ 1 1)) (+ 4 2))

(define v ("name")
(cond [((string=? v "name") #true)])

((+ 4 4))

(string-append "I am " 21 " years old")

(+ 1 5 - 3 9)

(define fx (+ 1 2 "1"))

(fx)

(define (g a)
  (+ a 1) (g 5))