;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 7.02-fit-mood_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'fit-mood?)
#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete
== Data ==
    1. Data Description✅
        1B. if using define-struct, write all accessor signatures✅
    2. Interpretation✅
    3. Data Examples✅
    4. A function template that processes this data✅
== Functions ==
    1. Signature, purpose, stub ✅
    2. Examples (aka check-expect, elaborate the concrete) ✅
    3. Template(from data)?✅
    3. Code body ✅
    4. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#

#|PROBLEM A:
Design a data definition to represent a movie, including  
title, duration, rating, and year released.

To help you to create some examples, find some interesting movie facts below: 
| title             | duration(mins) | rating | genre    |
|-------------------|----------------|--------|--------- |
| "Fight Club"      |  139           | "r"    |"action"  |
| "The Matrix"      |  136           | "r"    |"action"  |
| "Lord of War"     |  121           | "r"    |"drama"   |
| "The Social Net." |  120           | "pg13" |"drama"   |
| "Wreck it Ralph"  |  101           | "g"    |"action"  |
| "Gone Girl"       |  149           | "r"    |"thriller"|
| "Edge of Tomorrow"|  113           | "pg13" |"action"  |
|#

(define-struct movie [title duration rating genre])
; Movie is (make-movie String Natural Natural)
; interp. a movie with its title, duration in minutes, and genre.

; movie-title: (Movie -> String)
; movie-duration: (Movie -> Natural)
; movie-rating: (Movie -> String)
; movie-genre: (Movie -> String)
; movie?: (Any -> Boolean)

(define m1 (make-movie "Wreck it Ralph" 101 "g" "comedy"))
(define m2 (make-movie "Lord of War" 121 "r" "drama"))
(define m3 (make-movie "Gone Girl" 149 "r" "drama"))
(define m4 (make-movie "Edge of Tomorrow" 113  "pg13" "action"))
(define m5 (make-movie "Fight Club" 139 "r" "action"))
(define m6 (make-movie "The Matrix" 136 "r" "action"))

(define (movie-temp mv)
  (...
   (movie-title mv)
   (movie-duration mv)
   (movie-rating mv)
   (movie-genre mv)))

#| PROBLEM B:
Depending on your mood, sometimes you want a quick 90 minute comedy, and other times a 200 minute action movie. Design a function 'fit-mood?' that consumes
a movie, a natural number and a string. The goal is to determine if the given movie has a duration no longer than the provided upper limit, and is of the given genre.
|#

; fit-mood?: (Movie Natural String -> Boolean)
; produces #true if the given movie is within the given time-limit and genre, #false otherwise
(check-expect (fit-mood? m1 136 "action") #false) ; within timelimit but not genre
(check-expect (fit-mood? m6 136 "action") #true) ; within timelimt and genre
(check-expect (fit-mood? m5 136 "action") #false) ; not within timelimt and but within genre
(check-expect (fit-mood? m3 136 "action") #false) ; not within timelimt and not within genre

(define (fit-mood? mv time-limit genre)
  (and
   (<= (movie-duration mv) time-limit)
   (string=? genre (movie-genre mv))))

#;
(define (movie-temp mv time-limit genre)
  (...
   (movie-title mv)
   (movie-duration mv)
   (movie-rating mv)
   (movie-genre mv)))