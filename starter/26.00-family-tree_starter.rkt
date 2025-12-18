#lang htdp/isl+
(define PNAME 'family-tree)
#| Data definitions:
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete

1. Data Description✅
   1B. if using define-struct, write all accessor signatures✅
2. Interpretation✅
3. Data Examples❌
4. A function template that processes this data❌

Functions:
1. Signature, purpose, stub ❌
2. Examples (aka check-expect/tests, elaborate the concrete) ❌
  2B. if the function consumes a list, make sure a list of 2 or longer is tested❌
3. Template(from data)?❌
4. Code body ❌
5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
|#

#|
┌───────────────┐   ┌───────────────┐
│ Carl(1938)    │   │ Bettina(1938) │◄───────────────┐
│ Eyes: green   │   │ Eyes: green   │                │
└───────────────┘   └───────────────┘                │
     ▲  ▲  ▲           ▲        ▲                    │
     │  │  │   ┌───────┘        │                    │
     │  │  │   │                │                    │
     │  │  └───┼────────────────┼─────────┐          │
     │  └──────┼──────┐         │         │          │
┌────┴─────────┴┐   ┌─┴─────────┴───┐   ┌─┴──────────┴──┐   ┌───────────────┐
│ Adam(1962)    │   │ Dave(1967)    │   │ Eva (1977)    │   │ Fred(1978)    │
│ Eyes: red     │   │ Eyes: black   │   │ Eyes: blue    │   │ Eyes: pink    │
└───────────────┘   └───────────────┘   └───────────────┘   └───────────────┘
                                                    ▲          ▲
                                                    │          │
                                                  ┌─┴──────────┴──┐
                                                  │ Gus (2000)    │
                                                  │ Eyes: brown   │
                                                  └───────────────┘
|#

; An FamilyTree(FT) is one of:
; – #false
; – (make-person FamilyTree FamilyTree String N String)
; interp. #false means no parent
(define FamilyTree
  (signature
   (mixed
    False
    PersonSig)))

(define-struct person [mother father name birth-year eyes])
(define PersonSig (signature (PersonOf FamilyTree FamilyTree String Number String)))
; interp.
; eyes is the color of their eyes

; familytree-temp : (FamilyTree -> ???)
(define (familytree-temp fam-tree)
  (cond
    [(false? fam-tree) ...]
    [else
     (...
      (familytree-temp (person-mother fam-tree))
      (familytree-temp (person-father fam-tree))
      (person-name fam-tree)
      (person-birth-year fam-tree)
      (person-eyes fam-tree))]))

#|PROBLEM A:
Given the above family tree chart, model it with code using "make-person"
|#


#|PROBLEM B:
Design a function "blue-eyed-linage?"
that produces #true if the given family tree is of blue-eyed decent
|#


#|PROBLEM C:
Design a function "count-persons" that consumes a FamilyTree
that produces the count of the people in the tree
|#


#|PROBLEM D:
Develop the function "average-age".
It consumes a FamilyTree and the current year.
It produces the average age of all child structures in the FamilyTree
|#


#|PROBLEM E:
Develop the function "everyones-eye-colors", which consumes a FamilyTree and
produces a list of all eye colors in the tree.
An eye color may occur more than once in the resulting list.
Hint Use built-in "append" to concatenate the lists resulting from the recursive calls.
|#


#|PROBLEM E:
Design a function "has-blue-eyed-ancestor?"
that produces #true ONLY if the ANCESTORS have blue-eyes(exclude self)
|#


#|note on code clarity:(optional refactor):
ONLY AFTER GRADING SUBMISSION

Instead of using #false for representing no-parent,
replace it with the following empty struct
(define-struct no-parent [])
This makes it so that the cond branches read more nicely
[(false? fam-tree) ...] ; need to remember what false means or lookitup
[(no-parent? fam-tree) ...] ; built right into the name
|#