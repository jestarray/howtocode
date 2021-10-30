;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6.1-punctuate_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
HTDF STEPS: Turn all ❌ into ✅ for each step you complete
    1. Signature, purpose, stub ✅
    2. Examples (aka check-expect, elaborate the concrete) ✅
    3. Template(aka Sketch/Outline) ✅
    4. Code body ✅
    5. Test, review, and refactor(clean up your code! ctrl+i to auto-format) ✅
|#

#| PROBLEM 6.1: punctuate

Design a function that consumes an unpuctuated sentence and adds a question mark(?) if the sentence is a question, otherwise add a period.
HINT: Assume a sentence is a question if it contains the words "who, what, where, how"

examples:
"what time is it" -> "what time is it?"
"How are you" -> "How are you?"
"who are you" -> "who are you?"
"where am i?" -> "where am i?"
"i'm hungry" -> "i'm hungry."
|#

; punctuate: (String -> String)
; produces the given string with a "?" if it is a sentence, otherwise a "."
(check-expect (punctuate "what time is it") "what time is it?")
(check-expect (punctuate "How are you") "How are you?")
(check-expect (punctuate "i'm hungry") "i'm hungry.")

; (define (punctuate str) "")

; TEMPLATE:
#;
(define (punctuate str)
  (cond [(... str) ...]
        [else ...]))

(define (punctuate str)
  (cond [(or
          (string-contains-ci? "how" str)
          (string-contains-ci? "what" str)
          (string-contains-ci? "who" str)
          (string-contains-ci? "where" str))
         (string-append str "?")]
        [else
         (string-append str ".")]))