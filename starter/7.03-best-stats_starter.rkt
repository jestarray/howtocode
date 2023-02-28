;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 7.03-best-status_starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'best-stats)
#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete
== Data ==
    1. Data Description❌
        1B. if using define-struct, write all accessor signatures❌
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

#|PROBLEM A:
Design a data definition to model properties of an item in a video game. Name your data 'item'.

|   name   | attack | defense | price|
|----------|--------|---------|------|
| "spear"  |     10 |      20 |   31 |
| "sword"  |     20 |       5 |   43 |
| "sheild" |      5 |      40 |   25 |
| "dagger" |      5 |       5 |   10 |
| "knife"  |      5 |       5 |   5  |
|#

#|PROBLEM B:
Design a function 'best-stats' that produces the name of the item with the most COMBINED stats
Combined stat should only include attack and defense points. 
If equal, produce the name of the second given item
|#