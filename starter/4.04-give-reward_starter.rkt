;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname image-larger_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'give-reward?)
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

#| PROBLEM A:
Rankings in various games like Chess, League of Legends, Rocket League, use 
metal names to showcase rankings. 
A rank can be either(ordered from worst to best):
Bronze, Silver, Gold, Platinum, or Diamond

Write the data definition for "Rank" following the design recipe for data.
|#

#| PROBLEM B:
Use the data definition you wrote above and design a "give-reward?" function 
that determines whether or not a rank is eligible for an award.
Rewards are only given to those gold or higher
|#