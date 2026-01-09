;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 5.4-TLDR_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'tldr)
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

; ############################################################################

#| PROBLEM:
Design a function named 'tldr' that consumes a string and a number that is the capacity. 
If the string is longer than the given capacity, produce only the string up to the given capacity 
appended by "..." , otherwise produce the string.
Example:
(tldr "dog" 3) -> "dog"
(tldr "hungry hippos" 3) -> "hun..."
|#

; tldr: String Number -> String
; produces the string appended ... if greater than the length, otherwise produces the string
(check-expect (tldr "once upon a time" 4) "once...")
(check-expect (tldr "once" 4) "once")
(check-expect (tldr "super fantastic" 3) "sup...")

#;
(define (tldr str cap)
  (... str cap))

(define (tldr str cap)
  (if (> (string-length str) cap)
      (string-append (substring str 0 cap) "...")
      str))