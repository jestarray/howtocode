;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 16.06-join_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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
    1. Signature, purpose, stub ✅
    2. Examples (aka check-expect/tests, elaborate the concrete) ✅
      2B. if the function consumes a list, make sure a list of 2 or longer is tested ✅
    3. Template(from data)?✅
    4. Code body ✅
    5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#

; NEListOfString(NonEmptyListOfString) is one of:
; - (cons String empty) 
; - (cons String ListOfString)

; ne-strings-temp : (NEListOfString -> ???)
(define (ne-strings-temp string-lst)
  (cond
    [(empty? string-lst) ...]
    [else
     (... (first string-lst)
          (ne-strings-temp (rest string-lst)))]))

#|PROBLEM A:
Notice how the data design step is done. 
Write a function join that consumes NEListOfString, and additional delimiter string(delimiter).
The function produces a single string consisting of all the list elements joined together,
separated by copies of delimiter.
For example:
(join (cons "a" empty) "/")) -> "a"
(join (cons "A" (cons "B" (cons "C" empty))) "/") -> "A/B/C"
|#

; join : (NEListOfString String -> String)
; produces a new string where each string is seperated by a delimeter
(check-expect (join (cons "a" empty) "/") "a")
(check-expect (join (cons "a" (cons "b" empty)) "/") "a/b")
(check-expect (join (cons "A" (cons "B" (cons "C" empty))) "/") "A/B/C")

; (define (join string-list delimiter) "")
(define (join string-lst delimiter)
  (cond
    [(= (length string-lst) 1)
     (first string-lst)]
    [else
     (string-append
      (first string-lst)
      delimiter
      (join (rest string-lst) delimiter))]))