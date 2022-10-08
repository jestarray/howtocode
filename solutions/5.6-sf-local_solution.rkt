;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 7.0-sf-local_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'sf-local)
#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
HTDF STEPS: Turn all ❌ into ✅ for each step you complete
    1. Signature, purpose, stub ✅
    2. Examples (aka check-expect, elaborate the concrete) ✅
    3. Template(aka Sketch/Outline) ✅
    4. Code body ✅
    5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#

#| PROBLEM: 
A valid phone number must be 10 digits long and cannot start with 0 or 1. A phone number is considered
to be San Francisco local if it begins with one of the following area codes: 415, 510, 650

Design a function named 'sf-local?' that consumes a string pnum that produces #true if a number is a 
San Francisco local

"4159287278" -> #true
"1415017384" -> #false
|#

; get-area-code: (String -> String)
; produces the first 3 characters of the given string (assumes string-length >= 3)
(check-expect (area-code "4159287278") "415")

(define (area-code pnum)
  (substring pnum 0 3))

; sf-local?: (String -> Boolean)
; produces #true if the given phone number is valid and is local to San Francisco

(check-expect (sf-local? "4159287278") #true)
(check-expect (sf-local? "5109287278") #true)
(check-expect (sf-local? "6509287278") #true)
(check-expect (sf-local? "1509287278") #false)
(check-expect (sf-local? "0509287278") #false)
(check-expect (sf-local? "050") #false)

#;
(define (sf-local? pnum)
  (... pnum))

(define (sf-local? pnum)
  (and (= (string-length pnum) 10)
       (not (string=? (substring pnum 0 1) "0"))
       (not (string=? (substring pnum 0 1) "1"))
       (or (string=? (area-code pnum) "415")
           (string=? (area-code pnum) "510")
           (string=? (area-code pnum) "650"))))