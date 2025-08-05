;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 17.02-compatabile-liters_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'compatabile-liters)
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

#|PROBLEM A:
Design a function 'compat-blood?' that consumes a receipient and donor bloodtypes 
and produces whether the recipient is compataible with the donors blood given the following:
    A recipient can receive blood from anyone with the same blood type.
    A person with O- blood can be a donor for anyone BUT can only recieve its own type.
    A person with AB+ blood can receive blood from anyone.
    Additonally, a person with AB- blood can receive blood from a donor with B- or A- blood.
    Additonally, a person with A+ blood can receive blood from a donor with O+ or A- blood.
    Additonally, a person with B+ blood can receive blood from a donor with O+ or B- blood.
    No other combination of donor and recipient blood types is compatible.

NOTE: The data design and tests has been done for you in this problem.
CHART: https://howtocode.pages.dev/images/bloodtype.jpg
|#

; BloodType is one of:
; -"AB+"
; -"AB-"
; -"A+" 
; -"A-" 
; -"B+" 
; -"B-" 
; -"O+"
; -"O-"
; interp. all the types of blood

(define (bloodtype-temp bld)
  (cond
    [(string=? bld "AB+") ...]
    [(string=? bld "AB-") ...]
    [(string=? bld "A+") ...]
    [(string=? bld "A-") ...]
    [(string=? bld "B+") ...]
    [(string=? bld "B-") ...]
    [(string=? bld "O+") ...]
    [(string=? bld "O-") ...]))

; compat-blood? (BloodType BloodType -> Boolean)
; produces #true if the first given bloodtype is compatabile with blood of the second given bloodtype

; O+ can only recieve blood from itself or O-
(check-expect (compat-blood? "O+" "O+") #true)
(check-expect (compat-blood? "O+" "O-") #true)
(check-expect (compat-blood? "O+" "A+") #false)
(check-expect (compat-blood? "O+" "A-") #false)
(check-expect (compat-blood? "O+" "B+") #false)
(check-expect (compat-blood? "O+" "B-") #false)
(check-expect (compat-blood? "O+" "AB+") #false)
(check-expect (compat-blood? "O+" "AB-") #false)

; O- can only recieve blood from itself
(check-expect (compat-blood? "O-" "O+") #false)
(check-expect (compat-blood? "O-" "O-") #true)
(check-expect (compat-blood? "O-" "A+") #false)
(check-expect (compat-blood? "O-" "A-") #false)
(check-expect (compat-blood? "O-" "B+") #false)
(check-expect (compat-blood? "O-" "B-") #false)
(check-expect (compat-blood? "O-" "AB+") #false)
(check-expect (compat-blood? "O-" "AB-") #false)

; A+ can only recieve blood from itself or A- or O+ or O-
(check-expect (compat-blood? "A+" "O+") #true)
(check-expect (compat-blood? "A+" "O-") #true)
(check-expect (compat-blood? "A+" "A+") #true)
(check-expect (compat-blood? "A+" "A-") #true)
(check-expect (compat-blood? "A+" "B+") #false)
(check-expect (compat-blood? "A+" "B-") #false)
(check-expect (compat-blood? "A+" "AB+") #false)
(check-expect (compat-blood? "A+" "AB-") #false)

; A- can only recieve blood from itself or A- or O-
(check-expect (compat-blood? "A-" "O+") #false)
(check-expect (compat-blood? "A-" "O-") #true)
(check-expect (compat-blood? "A-" "A+") #false)
(check-expect (compat-blood? "A-" "A-") #true)
(check-expect (compat-blood? "A-" "B+") #false)
(check-expect (compat-blood? "A-" "B-") #false)
(check-expect (compat-blood? "A-" "AB+") #false)
(check-expect (compat-blood? "A-" "AB-") #false)

; B+ can only recieve blood from itself or O+ or B- or O-
(check-expect (compat-blood? "B+" "O+") #true)
(check-expect (compat-blood? "B+" "O-") #true)
(check-expect (compat-blood? "B+" "A+") #false)
(check-expect (compat-blood? "B+" "A-") #false)
(check-expect (compat-blood? "B+" "B+") #true)
(check-expect (compat-blood? "B+" "B-") #true)
(check-expect (compat-blood? "B+" "AB+") #false)
(check-expect (compat-blood? "B+" "AB-") #false)

; B- can only recieve blood from itself or O-
(check-expect (compat-blood? "B-" "O+") #false)
(check-expect (compat-blood? "B-" "O-") #true)
(check-expect (compat-blood? "B-" "A+") #false)
(check-expect (compat-blood? "B-" "A-") #false)
(check-expect (compat-blood? "B-" "B+") #false)
(check-expect (compat-blood? "B-" "B-") #true)
(check-expect (compat-blood? "B-" "AB+") #false)
(check-expect (compat-blood? "B-" "AB-") #false)

(check-expect (compat-blood? "AB+" "A+") #true) ; AB+ can recieve blood from anyone

; AB- can only recieve B- or A- or O- or itself
(check-expect (compat-blood? "AB-" "O+") #false)
(check-expect (compat-blood? "AB-" "O-") #true)
(check-expect (compat-blood? "AB-" "A+") #false)
(check-expect (compat-blood? "AB-" "A-") #true)
(check-expect (compat-blood? "AB-" "B+") #false)
(check-expect (compat-blood? "AB-" "B-") #true)
(check-expect (compat-blood? "AB-" "AB+") #false)
(check-expect (compat-blood? "AB-" "AB-") #true)

; AB- can only recieve B- or A- or O- or itself
(check-expect (compat-blood? "AB-" "O+") #false)
(check-expect (compat-blood? "AB-" "O-") #true)
(check-expect (compat-blood? "AB-" "A+") #false)
(check-expect (compat-blood? "AB-" "A-") #true)
(check-expect (compat-blood? "AB-" "B+") #false)
(check-expect (compat-blood? "AB-" "B-") #true)
(check-expect (compat-blood? "AB-" "AB+") #false)
(check-expect (compat-blood? "AB-" "AB-") #true)

(define (compat-blood? bld donor)
  (cond
    [(string=? bld donor) #true] ; compat with itself
    [(string=? donor "O-") #true] ; O- is universal donor
    [(string=? bld "AB+") #true] ; AB+ can recieve any
    [(string=? bld "AB-") (or (string=? donor "B-") (string=? donor "A-"))]
    [(string=? bld "A+") (or (string=? donor "A-") (string=? donor "O+"))]
    [(string=? bld "B+") (or (string=? donor "O+") (string=? donor "B-"))]
    [else
     #false]))


#|PROBLEM B:
Write a function 'compatabile-liters' that consumes a ListOfBloodType and a bloodtype,
and adds 1 liter per bloodtype in the list that is compatable with the given boodtype.
Use 'compat-blood?' in your solution
For example:
(compatabile-liters (cons "A-" (cons "O-" empty)) "AB-")
produces:
2
|#

; ListOfBloodType is one of:
; - empty
; - (cons BloodType ListOfBloodType)
; interp. a list of BloodType (represented with strings)
(define bloods1 (cons "A-" (cons "O-" empty)))
(define every-blood 
  (cons "AB+" (cons "AB-" (cons "A+"  (cons "A-"  (cons "B+"  (cons "B-"  (cons "O+" (cons "O-" empty)))))))))

(define (list-blood-temp bank)
  (cond
    [(empty? bank) ...]
    [else
     (... (first bank)
          (list-blood-temp (rest bank)))]))

; compatabile-liters: (ListOfBloodType BloodType -> Number)
; produces the number of liters that are compatabile with the given bloodtype
; in the given list
(check-expect (compatabile-liters empty "AB+") 0)
(check-expect (compatabile-liters bloods1 "AB-") 2)
(check-expect (compatabile-liters every-blood "AB+") 8)
(check-expect (compatabile-liters every-blood "AB-") 4)
(check-expect (compatabile-liters every-blood "A+") 4)
(check-expect (compatabile-liters every-blood "B+") 4)
(check-expect (compatabile-liters every-blood "A-") 2)
(check-expect (compatabile-liters every-blood "B-") 2)

; (define (compatabile-liters nums) 0)

(define (compatabile-liters bank btype)
  (cond
    [(empty? bank) 0]
    [else
     (if  (compat-blood? btype (first bank))
          (+ 1 (compatabile-liters (rest bank) btype))
          (compatabile-liters (rest bank) btype))]))