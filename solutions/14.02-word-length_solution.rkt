;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 14.02-word-length_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'word-length)
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
    2. Examples (aka check-expect/tests, elaborate the concrete) ✅
      2B. if the function consumes a list, make sure a list of 2 or longer is tested ✅
    3. Template(from data)?✅
    4. Code body ✅
    5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#

; ############################################################################

; ListOfString is one of:
; - empty
; - (cons String ListOfString)
; interp. a list of strings

; list-strings-temp : (ListOfString -> ???)
(define (list-strings-temp string-lst)
  (cond
    [(empty? string-lst) ...]
    [else
     (... (first string-lst)
          (list-strings-temp (rest string-lst)))]))

#|PROBLEM A:
Notice that data design steps are done above.
Design the function "word-length" produces a ListOfString
where each string is postfixed with "-<length>"
For example:
(word-length (cons "hello" (cons "meow" empty)))
produces:
(cons "hello-5" (cons "meow-4" empty))
Finish the uncompleted function design steps ❌ 1-5 above
|#

; word-length : (ListOfString -> ListOfString)
; produces a ListOfString where each string is appended by "-<length>"
(check-expect (word-length empty) empty)
(check-expect (word-length (cons "woof" empty))
              (cons "woof-4" empty))
(check-expect (word-length (cons "hello" (cons "meow" empty)))
              (cons "hello-5" (cons "meow-4" empty)))
;(define (word-length string-lst) empty)
(define (word-length string-lst)
  (cond
    [(empty? string-lst) empty]
    [else
     (cons
      (string-append
       (first string-lst)
       "-"
       (number->string (string-length (first string-lst))))
      (word-length (rest string-lst)))]))