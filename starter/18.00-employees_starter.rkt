;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 18.00-employees_starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'employees)
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
    4. A function template that processes this data❌
== Functions ==
    1. Signature, purpose, stub ❌
    2. Examples (aka check-expect/tests, elaborate the concrete) ❌
      2B. if the function consumes a list, make sure a list of 2 or longer is tested ❌
    3. Template(from data)?❌
    4. Code body ❌
    5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
|#

; Role is one of:
; - "Manager"
; - "Senior"
; - "Junior"
; - "Intern"

(define-struct employee [name wage role])
; Employee is (make-employee String String Number Role)
; interp
; name is fullname
; wage is US dollars per hour
; role is the job title
(define ava (make-employee "ava ryan" 32 "Manager"))
(define jack (make-employee "jack tar" 30 "Manager"))
(define anna (make-employee "anna yu" 25 "Senior"))
(define bob (make-employee "bob lee" 21 "Junior"))
(define jess (make-employee "jess smith" 19 "Intern"))

; employee-temp : (Employee -> ???)
(define (employee-temp empl)
  (...
   (employee-name empl)
   (employee-wage empl)
   (employee-role empl)))

; ListOfEmployees is one of:
; - empty
; - (cons Employee ListOfEmployees)
(define every1 (list ava jack anna bob jess))
(define zero-interns (list jack anna bob))

#|PROBLEM A:
Finish the template for ListOfEmployee
|#

; list-empl-temp : (ListOfEmployee -> ???)
; TODO

#|PROBLEM B:
Design a function "raise-wages" that consumes a ListOfEmployee and a Number
and increases everyones wages by that Number
|#

; raise-wages : (ListOfEmpolyee Number -> ListOfEmployee)
; increase the wages of all given employees by the given raise

#|PROBLEM C:
Design a function "filter-role" which consumes a ListOfEmployee and a Role
and produces only the set of Employees with the given Role
|#

; filter-role : (ListOfEmployee Role -> ListOfEmployee)

#|PROBLEM D:
Design a function "count-roles" that consumes a ListOfEmployees and a Role
and produces the count of employees in that role
|#

; count-roles : (ListOfEmployee Role -> Number)