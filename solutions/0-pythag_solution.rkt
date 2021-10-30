;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 0-pythag_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
PROBLEM:

 |\
 | \
 |  \
3|   \ ?
 |    \
 |     \
 |______\
    4

Two sides of a right triangle have length 3 and 4,
what is the length of the hypotenuse(longest side)?
Recall the Pythagorean Theorem solves this for us:
Reads: the square root(sqrt) of 3 * 3 + 4 * 4
  ______________
\/3 * 3 + 4 * 4

^ Encode the math expression above
in a BSL expression that will solve for the missing side ?
|#

(sqrt (+ (* 5 5) (* 4 4)))