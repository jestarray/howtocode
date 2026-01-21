#lang htdp/isl+
(define PNAME 'mask-secrets)
#| Data definitions:
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete

1. Data Description✅
   1B. if using define-struct, write all accessor signatures✅
2. Interpretation✅
3. Data Examples✅
4. A function template that processes this data✅

Functions:
1. Signature, purpose, stub ✅
2. Examples (aka check-expect/tests, elaborate the concrete) ✅
  2B. if the function consumes a list, make sure a list of 2 or longer is tested✅
3. Template(from data)?✅
4. Code body ✅
5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#

; ############################################################################

#|PROBLEM A:
Write a function mask-secrets that consumes a list of strings message
and a list of strings forbidden-words. 
The function produces a new list of strings where any word in the message that 
appears in the forbidden-words list is replaced by the string "REDACTED".

Example:
(mask-secrets (list "hide" "the" "gold" "in" "the" "cave") (list "gold" "cave"))
produces
(list "hide" "the" "REDACTED" "in" "the" "REDACTED")

HINT: you can use the built-in "member?" function
|#

(: mask-secrets ([ListOf String] [ListOf String] -> [ListOf String]))
(check-expect (mask-secrets empty empty) empty)
(check-expect (mask-secrets (list "foo") empty) (list "foo"))
(check-expect (mask-secrets empty (list "foo")) empty)
(check-expect (mask-secrets (list "foo") (list "foo")) 
              (list "REDACTED"))
(check-expect (mask-secrets (list "operation" "snake" "eater" "mission") (list "snake" "eater")) 
              (list "operation" "REDACTED" "REDACTED" "mission"))
(define (mask-secrets message forbidden)
  (cond
    [(empty? message) empty]
    [else
     (if (member? (first message) forbidden)
         (cons "REDACTED" (mask-secrets (rest message) forbidden))
         (cons (first message) (mask-secrets (rest message) forbidden)))]))