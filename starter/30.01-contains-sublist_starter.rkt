#lang htdp/isl+
(define PNAME 'contains-sublist)
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
1. Signature, purpose, stub ❌
2. Examples (aka check-expect/tests, elaborate the concrete) ❌
  2B. if the function consumes a list, make sure a list of 2 or longer is tested❌
3. Template(from data)?❌
4. Code body ❌
5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
|#

; ############################################################################

#|PROBLEM A:
Write a function "contains-sublist?" that consumes
two list of numbers and determines 
if l1 (the pattern) exists anywhere inside l2.
For example:
(contains-sublist? (list 8 6) (list 9 8 8 6 0))
                                        ^ 8&6 occurs here
produces:
#true
because the numbers (list 8 6) do occur in succession
HINT: You will most likely need a helper function
|#
