;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 9.04-charge-message_starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'charge-message)

#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete
== Data ==
    1. Data Description✅✅
        1B. if using define-struct, write all accessor signatures❌❌
    2. Interpretation✅✅
    3. Data Examples❌❌
    4. A function template that processes this data❌❌
== Functions ==
    1. Signature, purpose, stub ❌
    2. Examples (aka check-expect/tests, elaborate the concrete) ❌
    3. Template(from data)?❌
    4. Code body ❌
    5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
|#

; ############################################################################


#|PROBLEM A:
Finish the uncompleted steps ❌ of Data Design above for both Battery and Phone
|#

(define-struct battery [percent charge-rate])
; Battery is (make-battery Number Number)
; interp.
; percentage is the amount of charge
; charge-rate is the percentage of charge PER MINUTE

(define-struct phone [name battery])
; Phone is (make-phone String Battery)
; interp.
; name is the brand name and model
; battery is a reference to Battery


#|PROBLEM B:
Phones(mainly Android) have a feature where it will tell you how long it will take to charge:
"Charging: <current-percentage>% 19 m until full"

https://howtocode.pages.dev/images/charge_info.jpg
(don't worry about spacing percentange and minutes left into new lines)

We are only concerned with minutes, no need to convert them to hours(challenge yourself ;))
In the case of fully charged:
"Fully charged"

Design a function "charge-message" that consumes a Phone and provides the given purpose above.
|#
