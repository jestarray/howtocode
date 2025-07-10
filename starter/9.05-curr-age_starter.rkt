;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 9.05-curr-age_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'curr-age)

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

#|PROBLEM A:
Finish the uncompleted steps ❌ of Data Design above for Person and Date 
|#

(define-struct date [month day year])
; Date is (make-date Number Number Number)
; interp.
; Fields are self explanatory

(define-struct person [fname lname birthdate])
; Person is (make-person String String Date)
; interp.
; fname means firstname
; lname means lastname
; date is self explanitory

#|PROBLEM B:
Design the function "curr-age" that consumes a Date and a Person, and produces the approximate age of the Person relative the given date 
|#

; curr-age : (Date Person -> Number)