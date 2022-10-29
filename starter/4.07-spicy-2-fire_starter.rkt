;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname spicy->fire) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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
    3. Code body ❌
    4. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
|#

#|Problem A:
A company has a digital self order food menu tablet in their store.
The menu has a description of how spicy some foods are. The descriptions are
Not Spicy, Mild, Medium, Hot, Extra Hot, Extremely Hot.

Write the data definition for "SpicyDescription" 
following the design recipe for data.
|#

#|Problem B:
You get complaints by customers who cannot read english because
they do not understand the "SpicyDescription". You come up with
the genius idea to mimic the 5 star⭐ rating system but with  
the fire emoji 🔥 instead.

Design a function "spicy->fire" that consumes SpicyDescription
and produces a string of chilipeppers in an increasing amount
corresponding to the "SpicyDescription" data definition following
the design recipe for functions.

For example:
"Not Spicy" -> ""
"Mild" -> "🔥"
"Medium" -> "🔥🔥"
|#