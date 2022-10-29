;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4.08-scoville->spicy_starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'scoville->spicy)
#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete
== Data ==
    1. Data Description✅
    2. Interpretation✅
    3. Data Examples✅
    4. A function template that processes this data❌
== Functions ==
    1. Signature, purpose, stub ❌
    2. Examples (aka check-expect, elaborate the concrete) ❌
    3. Template(from data)?❌
    3. Code body ❌
    4. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
|#

; SpicyDescription is one of:
;- "Not Spicy"
;- "Mild"
;- "Medium"
;- "Hot"
;- "Extra Hot"
;- "Extra Extremely Hot"
; interp. english descriptions of how spicy food is.

(define NOT-SPICY "Not Spicy")
(define MILD "Mild")
(define MEDIUM "Medium")
(define HOT "Hot")
(define EXTRA-HOT "Extra Hot")
(define EXTREMELY-HOT "Extremely Hot")

(define (spicydescription-temp desc)
  (cond
    [(string=? desc NOT-SPICY) ...]
    [(string=? desc MILD) ...]
    [(string=? desc MEDIUM) ...]
    [(string=? desc HOT) ...]
    [(string=? desc EXTRA-HOT) ...]
    [(string=? desc EXTREMELY-HOT) ...]))

; Scoville is a Natural Number that falls into one of:
; - [0 to 100)
; - [100 to 2,500)
; - [2,500 to 30,000)
; - [30,000 to 100,000)
; - [100,000 to 300,000)
; - [300,000, infinity]
; interp. a measurement of how spicey something is.
; [0 to 100) means Not Spicy
; [100 to 2,500) means Mild
; [2,500 to 30,000) means Medium
; [30,000 to 100,000) means Hot
; [100,000 to 300,000) means Extra Hot
; [300,000, infinity] means Extremely Hot
; <examples are skipped>

#|Problem:
Customers are angry at how inaccurate SpicyDescriptions are as
taste buds vary. The company has decided to measure their food
using scoville units and then translate that to a SpicyDescription
as number measurements do not lie. 

You are given the data descriptions of "Scoville" and "SpicyDescription" above.
Write a "scoville->spicy" that consumes Scoville and produces a SpicyDescription
based on the interpretation of Scoville.

HINT: Notice how some steps of the desgin recipe are done for "Scoville".
Finish writing the template for Scoville following:
https://howtocode.pages.dev/htdp_templates#interval_cheatsheet
and use the template to then write the function following the functions recipe.
|#