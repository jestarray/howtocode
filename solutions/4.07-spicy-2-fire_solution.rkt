;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4.07-spicy->fire_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'spicy->fire)
#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete
== Data ==
    1. Data Description❌
    2. Interpretation❌
    3. Data Examples❌
    4. A function template that processes this data❌
== Functions ==
    1. Signature, purpose, stub ❌
    2. Examples (aka check-expect, elaborate the concrete) ❌
    3. Template(from data)?❌
    4. Code body ❌
    5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
|#

#|PROBLEM A:
A company has a digital self order food menu tablet in their store.
The menu has a description of how spicy some foods are. The descriptions are
Not Spicy, Mild, Medium, Hot, Extra Hot, Extremely Hot.

Write the data definition for "SpicyDescription" 
following the design recipe for data.
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

#|PROBLEM B:
You get complaints by non-english speaking customers about how
they cannot understand "SpicyDescription". You come up with
the genius idea to mimic the 5 star⭐ rating system but with  
the fire emoji 🔥 instead.

Design a function "spicy->fire" that consumes SpicyDescription
and produces a string of fire emojis in an increasing amount
corresponding to the "SpicyDescription" data definition following
the design recipe for functions.

For example:
"Not Spicy" -> ""
"Mild" -> "🔥"
"Medium" -> "🔥🔥"
|#

; spicy->fire: (SpicyDescription -> String)
; produces repeating amounts of chili pepper emojis
; based on the description
(check-expect (spicy->fire NOT-SPICY) "")
(check-expect (spicy->fire MILD) "🔥")
(check-expect (spicy->fire MEDIUM) "🔥🔥")
(check-expect (spicy->fire HOT) "🔥🔥🔥")
(check-expect (spicy->fire EXTRA-HOT) "🔥🔥🔥🔥")
(check-expect (spicy->fire EXTREMELY-HOT) "🔥🔥🔥🔥🔥")

; (define (spicy->fire desc) "")

(define (spicy->fire desc)
  (cond
    [(string=? desc NOT-SPICY) ""]
    [(string=? desc MILD) "🔥"]
    [(string=? desc MEDIUM) "🔥🔥"]
    [(string=? desc HOT) "🔥🔥🔥"]
    [(string=? desc EXTRA-HOT) "🔥🔥🔥🔥"]
    [(string=? desc EXTREMELY-HOT) "🔥🔥🔥🔥🔥"]))
