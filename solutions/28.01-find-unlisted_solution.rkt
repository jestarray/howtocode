#lang htdp/isl+
(define PNAME 'find-unlisted)
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
Write a function "find-unlisted-items" that consumes a list of strings(inventory) 
and another list of strings(approved-items). 
The function should produce a list of all items 
in inventory that are NOT found in the approved-items list (i.e., the "illegal" items)

Given:
(find-unlisted-items (list "apple" "bolt" "pear" "wrench") (list "apple" "pear" "banana"))
produce
(list "bolt" "wrench")

HINT: you can use the built-in "member?" function
|#

(: find-unlisted-items ([ListOf String] [ListOf String] -> [ListOf String]))
(check-expect (find-unlisted-items empty empty) empty)
(check-expect (find-unlisted-items empty (list "test")) empty)
(check-expect (find-unlisted-items (list "test") empty) (list "test"))
(check-expect (find-unlisted-items (list "test") (list "test")) empty)
(check-expect (find-unlisted-items (list "apple" "bolt" "pear" "wrench") (list "apple" "pear" "banana"))
              (list "bolt" "wrench"))

(define (find-unlisted-items inventory approved)
  (cond
    [(empty? inventory) empty]
    [else
     (if  (member? (first inventory) approved)
          (find-unlisted-items (rest inventory) approved)
          (cons (first inventory) (find-unlisted-items (rest inventory) approved)))]))