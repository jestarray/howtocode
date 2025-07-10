;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 9.03-data-info_starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'data-info)

#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete
== Data ==
    1. Data Description✅✅
        1B. if using define-struct, write all accessor signatures❌❌
    2. Interpretation✅✅
    3. Data Examples❌❌
    4. A function template that processes this data❌❌
== Functions ==
    1. Signature, purpose, stub ❌
    2. Examples (aka check-expect/tests, elaborate the concrete) ❌
      2B. if the function consumes a list, make sure a list of 2 or longer is tested
    3. Template(from data)?❌
    3. Code body ❌
    4. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
|#


#|PROBLEM A:
Finish the uncompleted steps ❌ of Data Design above for both Storage and Computer
|#

(define-struct storage [occupied capacity])
; Storage is (make-storage Number Number)
; interp.
; occupied is in GB and is the amount of data in use
; capacity is in GB and is the amount of max data to store


(define-struct computer [brand drive])
; Computer is (make-computer String Drive)
; interp.
; brand is the name of the brand
; drive is how much storage the computer has

#|PROBLEM B:
On Windows File Explorer in the "This PC" section, 
there is a message below the hard drive displaying how much storage is left free:
"X GB free of Y GB"
X is how much free space is left
Y is the max capacity of the drive
https://howtocode.pages.dev/images/windows_storage.png
Design a function: "data-info" that consumes a computer and produces a message about how much is left as stated above
|#
