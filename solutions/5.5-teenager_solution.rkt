;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname teenager) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'teenager)
#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
HTDF STEPS: Turn all ❌ into ✅ for each step you complete
    1. Signature, purpose, stub ✅
    2. Examples (aka check-expect, elaborate the concrete) ✅
    3. Template(aka Sketch/Outline) ✅
    4. Code body ✅
    5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#

#| PROBLEM: 
Design a function 'is-teenager?' that consumes an age and produces true if the age is between [12, 16] inclusive
|#


; is-teenager?: (Number -> Boolean)
; produces whether the given age is in the range of 12 to 16 inclusive, a teenager

(check-expect (is-teenager? 11) #false)
(check-expect (is-teenager? 12) #true)
(check-expect (is-teenager? 14) #true)
(check-expect (is-teenager? 16) #true)
(check-expect (is-teenager? 17) #false)

#;
(define (is-teenager? age)
    (... age))

(define (is-teenager? age)
    (and (>= age 12) (<= age 16)))
