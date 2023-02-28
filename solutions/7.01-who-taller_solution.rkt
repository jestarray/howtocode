;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 7.01-who-taller_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'who-taller?)
#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete
== Data ==
    1. Data Description✅
        1B. if using define-struct, write all accessor signatures✅
    2. Interpretation✅
    3. Data Examples✅
    4. A function template that processes this data✅
== Functions ==
    1. Signature, purpose, stub ✅
    2. Examples (aka check-expect, elaborate the concrete) ✅
    3. Template(from data)?✅
    3. Code body ✅
    4. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#

#|PROBLEM A:
Design a compound data definition to model properties of people, call it 'person'. 

Example people:
| firstname | lastname | height(in cm) |
|-----------|----------|---------------|
| "Joe"     | "Smith"  |           100 |
| "Lisa"    | "Su"     |           120 |
| "Jack"    | "Lee"    |           120 |
|#

(define-struct person [fn ln height])
; Person is (make-person String String Natural)
; fn means firstname
; ln means lastname
; height is how tall in centimeters 

; person-fn: (Person -> String)
; person-ln: (Person -> String)
; person-height: (Person -> Natural)
; person?: (Any -> Boolean)

(define p0 (make-person "joe" "smith" 100))
(define p1 (make-person "lisa" "su" 120))
(define p2 (make-person "jack" "lee" 120))

(define (person-temp ps)
  (... (person-fn ps)
       (person-ln ps)
       (person-height ps)))

#|PROBLEM B:
Design a function 'who-taller?' that consumes 2 persons and produces the first name of whoever is taller 
If both are the same height, produce the second persons first name.|#

; who-taller?: (Person Person -> String)
; produces the first name of which of the 2 given persons is taller. If equal, we assume 2nd person is taller
(check-expect (who-taller? p0 p1) "lisa")
(check-expect (who-taller? p1 p0) "lisa")
(check-expect (who-taller? p1 p2) "jack")

#| ;template
(define (who-taller?-temp ps ps2)
    (... (person-fn ps)
         (person-ln ps)
         (person-height ps)

         (person-fn ps2)
         (person-ln ps2)
         (person-height ps2)))
|#

(define (who-taller? ps ps2)
  (if (> (person-height ps) (person-height ps2))
      (person-fn ps)
      (person-fn ps2)
      ))

; (define (who-taller? ps1 ps2) "")