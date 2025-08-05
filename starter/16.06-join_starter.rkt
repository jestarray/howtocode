;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 16.06-join_starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'join)
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
    1. Signature, purpose, stub ❌
    2. Examples (aka check-expect/tests, elaborate the concrete) ❌
      2B. if the function consumes a list, make sure a list of 2 or longer is tested ❌
    3. Template(from data)?❌
    4. Code body ❌
    5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
|#

#|PROBLEM A:
Notice how the data design step is done. Write a function join that consumes a non-empty list of strings(strings-list), together with an additional delimiter string(delimiter).
The function produces a single string consisting of all the list elements joined together,
separated by copies of del.
For example:
(join (cons "A" (cons "B" (cons "C" empty))) "/")
produces:
"A/B/C"
|#

; ListOfString is one of:
; - empty
; - (cons Number ListOfString)
; interp. a list of Strings
(define str0 empty)
(define str1 (cons "a" empty))
(define str2 (cons "a" (cons "b" empty)))
(define str3 (cons "a" (cons "b" (cons "c" (cons "d" empty)))))

(define (strings-temp string-lst)
  (cond
    [(empty? string-lst) ...]
    [else
     (... (first string-lst)
          (string-temp (rest string-lst)))]))

; join: (ListOfString String -> String)
; produces a new string where each string is seperated by a delimeter