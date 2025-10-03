;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 18.00-employees_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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
    4. A function template that processes this data✅
== Functions ==
    1. Signature, purpose, stub ✅
    2. Examples (aka check-expect/tests, elaborate the concrete) ✅
      2B. if the function consumes a list, make sure a list of 2 or longer is tested ✅
    3. Template(from data)?✅
    4. Code body ✅
    5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
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

; list-empl-temp : (ListOfEmployee -> ???)
(define (list-empl-temp empl-ls)
  (cond
    [(empty? empl-ls) ...]
    [else
     (... (employee-temp (first empl-ls))
          (list-empl-temp (rest empl-ls)))]))

#|PROBLEM A:
Design a function "raise-wages" that consumes a ListOfEmployee and a Number
and increases everyones wages by that Number
|#

; raise-wages : (ListOfEmpolyee Number -> ListOfEmployee)
; increase the wages of all given employees by the given raise
(check-expect (raise-wages (list bob ava) 4)
              (list (up-wage bob 4)
                    (up-wage ava 4)))
(define (raise-wages empl-ls raise)
  (cond
    [(empty? empl-ls) empty]
    [else
     (cons (up-wage (first empl-ls) raise)
           (raise-wages (rest empl-ls) raise))]))

; up-wage : (Employee Number -> Employee)
; produces the updated employee with wage increased by the given raise
(check-expect (up-wage bob 4)
              (make-employee "bob lee" 25 "Junior"))
(define (up-wage empl raise)
  (make-employee
   (employee-name empl)
   (+ (employee-wage empl) raise)
   (employee-role empl)))

#|PROBLEM B:
Design a function "filter-role" which consumes a ListOfEmployee and a Role
and produces only the set of Employees with the given Role
|#

; filter-role : (ListOfEmployee Role -> ListOfEmployee)
; produces a subset of Employees that match the given Role
(check-expect (filter-role zero-interns "Intern") empty)
(check-expect (filter-role every1 "Intern") (list jess))
(check-expect (filter-role every1 "Manager") (list ava jack))
(define (filter-role empl-ls role)
  (cond
    [(empty? empl-ls) empty]
    [else
     (if (is-role? (first empl-ls) role)
         (cons (first empl-ls) (filter-role (rest empl-ls) role))
         (filter-role (rest empl-ls) role))]))

; is-role? : (Employee Role -> Boolean)
; produces #true if the give Employee is in the given Role
(check-expect (is-role? ava "Intern") #false)
(check-expect (is-role? ava "Manager") #true)
(define (is-role? empl role)
  (string=? (employee-role empl) role))

#|PROBLEM C:
Design a function "count-roles" that consumes a ListOfEmployees and a Role
and produces the count of employees in that role
|#

; count-roles : (ListOfEmployee Role -> Number)
; produces the amount of employees in the given role
(check-expect (count-roles every1 "Manager") 2)
(check-expect (count-roles zero-interns "Intern") 0)

(define (count-roles empl-ls role)
  (cond
    [(empty? empl-ls) 0]
    [else
     (if (is-role? (first empl-ls) role)
         (+ 1 (count-roles (rest empl-ls) role))
         (count-roles (rest empl-ls) role))]))