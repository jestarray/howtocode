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