;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 11.03-is-secure-pass_starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'is-secure-pass)

#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete
== Data ==
    1. Data Description✅
        1B. if using define-struct, write all accessor signatures✅
    2. Interpretation✅
    3. Data Examples❌
    4. A function template that processes this data❌
== Functions ==
    1. Signature, purpose, stub ❌
    2. Examples (aka check-expect/tests, elaborate the concrete) ❌
    3. Template(from data)?❌
    4. Code body ❌
    5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
|#

; ############################################################################

#|PROBLEM A:
Notice the Data Definitions for Pin and Text are done
Finish the uncompleted steps ❌ of Data Design above for "Password"(examples and template)
|#

(define-struct pin [num])
; Pin is (make-pin Number)
; interp.
; num (short for number), represents the pin number

; pin-num : (Pin -> Number)

; pin-temp : (Pin -> ???)
(define (pin-temp pn)
  (... (pin-num pn)))

(define-struct text [str])
; Text is (make-text String)
; interp.
; str represents the text characters of the password(including numbers)

; text-str : (Text -> String)

; text-temp : (Text -> ???)
(define (text-temp txt)
  (... (text-str txt)))

; union Password is one of:
; - (make-pin Number)
; - (make-text String)
; interp. represents a set of password storage methods

; TODO: 3. Examples and 4.Template

#|PROBLEM B:
Design a function "is-secure-pass?" that consumes a password.
It should produce #true if the pin or text length is 20 or more long
|#

; is-secure-pass? : (Password -> ???)