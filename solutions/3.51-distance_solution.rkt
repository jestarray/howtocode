;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 3.51-distance_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'distance)
#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
HTDF STEPS: Turn all ❌ into ✅ for each step you complete
    1. Signature, purpose, stub ❌
    2. Examples (aka check-expect, elaborate the concrete) ❌
    3. Template(aka Sketch/Outline) ❌
    4. Code body ❌
    5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
|#

; ############################################################################

#| PROBLEM: 
Design a function named 'distance' that consumes 4 numbers: x1, y1, and x2, y2 and calculates
the distance between the two points using the distance formula as described here:
  __________________________
\/ (x2 - x1)^2 + (y2 - y1)^2

More background:
https://youtu.be/0IOEPcAHgi4
https://www.varsitytutors.com/hotmath/hotmath_help/topics/distance-formula
|#

; Number Number Number Number -> Number
; produces the distance between the two given points

(check-expect (distance 3 0 0 4) 5)
(check-within (distance 0 1 1 0) (sqrt 2) .00001)

; template
#;
(define (distance x1 y1 x2 y2)
    (... x1 y1 x2 y2))

(define (distance x1 y1 x2 y2)
    (sqrt (+ (sqr (- x2 x1))
             (sqr (- y2 y1)))))