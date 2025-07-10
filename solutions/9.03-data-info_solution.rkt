;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 9.03-data-info_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'data-info)

#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete
== Data ==
    1. Data Description✅✅
        1B. if using define-struct, write all accessor signatures✅✅
    2. Interpretation✅✅
    3. Data Examples✅✅
    4. A function template that processes this data✅✅
== Functions ==
    1. Signature, purpose, stub ✅
    2. Examples (aka check-expect/tests, elaborate the concrete) ✅
    3. Template(from data)?✅
    3. Code body ✅
    4. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#


#|PROBLEM A:
Finish the uncompleted steps ❌ of Data Design above for both Storage and Computer
|#

(define-struct storage [occupied capacity])
; Storage is (make-storage Number Number)
; interp.
; occupied is in GB and is the amount of data in use
; capacity is in GB and is the amount of max data to store
(define st0 (make-storage 500 500))
(define st1 (make-storage 50 500))

; storage-occupied: (Storage -> Number)
; storage-capacity: (Storage -> Number)

(define (storage-temp st)
  (... (storage-occupied st)
       (storage-capacity st)))

(define-struct computer [brand drive])
; Computer is (make-computer String Drive)
; interp.
; brand is the name of the brand
; drive is how much storage the computer has
(define hp (make-computer "HP" st0))
(define dell (make-computer "DELL" st1))

; computer-brand : (Computer -> String)
; computer-drive: (Computer -> Storage)

(define (computer-temp cmp)
  (... (computer-brand cmp)
       (storage-temp (computer-drive cmp))))

#|PROBLEM B:
On Windows File Explorer in the "This PC" section, 
there is a message below the hard drive displaying how much storage is left free:
"X GB free of Y GB"
X is how much free space is left
Y is the max capacity of the drive
https://howtocode.pages.dev/images/windows_storage.png
Design a function: "data-info" that consumes a computer and produces a message about how much is left as stated above
|#

; data-info : (Computer -> String)
; produces the string "X GB free of Y GB" where:
; X is how much free space is left
; Y is the max capacity of the drive
(check-expect (data-info hp) "0 GB free of 500 GB")
(check-expect (data-info dell) "450 GB free of 500 GB")
;(define (data-info cmp) "")

(define (data-info cmp)
  (drive-info (computer-drive cmp)))

; drive-info : (Drive -> String)
; purpose is same as "data-info"
(define (drive-info st)
  (string-append
   (number->string (- (storage-capacity st) (storage-occupied st)))
   " GB free of "
   (number->string (storage-capacity st))
   " GB"))