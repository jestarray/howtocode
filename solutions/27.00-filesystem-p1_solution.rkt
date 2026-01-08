#lang htdp/isl+
(define PNAME 'filesystem-p1)
#| Data definitions:
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete

1. Data Description✅
   1B. if using define-struct, write all accessor signatures✅
2. Interpretation✅
3. Data Examples✅
4. A function template that processes this data✅

Functions:
1. Signature, purpose, stub ✅
2. Examples (aka check-expect/tests, elaborate the concrete) ✅
  2B. if the function consumes a list, make sure a list of 2 or longer is tested✅
3. Template(from data)?✅
4. Code body ✅
5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ✅
|#

#|PROBLEM A:
Write the template for Dir and LOFD
and use it to solve the rest of the problems
|#

(define-struct dir [name content])
; A Dir is a structure:
;   (make-dir String LOFD)

; dir-temp : (Dir -> ???)
#;
(define (dir-temp dtory)
  (...
   (dir-name dtory) ; String
   (lofd-temp (dir-content dtory)))) ; LOFD

; An LOFD (short for list of files and directories) is one of:
; – empty
; – (cons File LOFD)
; – (cons Dir LOFD)

; A File is a String. For now, it is just the filename

; lofd-temp : (LOFD -> ???)
#;
(define (lofd-temp f&ds)
  (cond
    [(empty? f&ds) ...]
    [(string? (first f&ds))
     (...
      (first f&ds) ; String
      (lofd-temp (rest f&ds)))]
    [else
     (...
      (dir-temp (first f&ds)) ; Dir
      (lofd-temp (rest f&ds)))]))

#|
HIERARCHIAL TREE DIAGRAM(A):
Note that brackets "[]" are directories

                                  [Documents]
              _________________________|_________________________
             /                         |                         \
            /                          |                          \
      [scripts]                    "todo.txt"                   [life]
    ______|______                                         ________|________
   /    /   \    \                                       /                 \
  /    /     \    \                                     /                   \
 /    |       |    \                                 [work]              [school]
 |    |       |     |                               /      \                |
 |    |       |     |                              /        \               |
 |    |       |  "costume.png"           "resume.pdf"    "cover.pdf"    "todo.txt"
 |    |   "part3.rtf"
 |  "part2.rtf"
 "part1.rtf"

SIDEBAR TREE DIAGRAM(A):

Documents/
├── scripts/
│   ├── part1.rtf
│   ├── part2.rtf
│   ├── part3.rtf
│   └── costume.png
├── todo.txt
└── life/
    ├── work/
    │   ├── resume.pdf
    │   └── cover.pdf
    └── school/
        └── todo.txt
|#

#|PROBLEM B:
Computers have directories(aka folders) and files.
The above 2 diagrams model the same Documents folder.
Translate the above diagram of a directory structure into code with "make-dir"
|#
(define scripts (make-dir "scripts" (list "part1.rtf" "part2.rtf" "part3.rtf" "costume.png")))
(define work (make-dir "work" (list "resume.pdf" "cover.pdf")))
(define school (make-dir "school" (list "todo.txt")))
(define life (make-dir "life" (list work school)))
(define documents (make-dir "Documents" (list scripts "todo.txt" life)))

#|PROBLEM C:
Design the function "count-files" which 
determines how many File's a given Dir contains(including Files in every subdirs)
For example:
Given: Documents , Produce: 8
|#

;(: count-files (Dir -> Number))
; produces the count of the files in the given dir
(check-expect (count-files work) 2)
(check-expect (count-files scripts) 4)
(check-expect (count-files life) 3)
(check-expect (count-files documents) 8)
; determines how many files a given
(define (count-files dtory)
  (count-files-list (dir-content dtory)))

;(: count-files (LOFD -> Number))
(check-expect (count-files-list empty) 0)
(define (count-files-list f&ds)
  (cond
    [(empty? f&ds) 0]
    [(string? (first f&ds))
     (+ 1 (count-files-list (rest f&ds)))]
    [else
     (+ (count-files (first f&ds))
        (count-files-list (rest f&ds)))]))

#|PROBLEM D:
Design the function "count-subdirs" which determines how many directories
there are in a given Dir(including subdirs). Note that we EXCLUDE ourself! 
So the documents dir would have 4
|#

; (: count-subdirs (Dir -> Number))
; produces the count of how many sub-directories there are in a given Dir
(check-expect (count-subdirs scripts) 0)
(check-expect (count-subdirs life) 2)
(check-expect (count-subdirs documents) 4)
(define (count-subdirs dtory)
  (count-dirs-list (dir-content dtory)))

; count-dirs-list : (LOFD -> Number)
(check-expect (count-dirs-list empty) 0)
(check-expect (count-dirs-list (list scripts "todo.txt" life)) 4)
(define (count-dirs-list f&ds)
  (cond
    [(empty? f&ds) 0]
    [(string? (first f&ds))
     (count-dirs-list (rest f&ds))]
    [else
     (+ 1
        (count-subdirs (first f&ds))
        (count-dirs-list (rest f&ds)))]))

#|PROBLEM E:
Design the function "count-txts" which determines 
how many files with the ".txt" there are in a given Dir,
including those in subdirs
You can assume all files end in 3 letter extension names, e.g "pdf, txt, mp3, png"
|#

; (: count-txts (Dir -> Number))
; produces the count of how many ".txt" files there are in the given directory
(check-expect (count-txts documents) 2)
(define (count-txts dtory)
  (count-txts-list (dir-content dtory)))

; (: count-txts-list (LOFD -> Number))
(define (count-txts-list f&ds)
  (cond
    [(empty? f&ds) 0]
    [(string? (first f&ds))
     (if (is-txt? (first f&ds))
         (+ 1 (count-txts-list (rest f&ds)))
         (count-txts-list (rest f&ds)))]
    [else
     (+ (count-txts (first f&ds))
        (count-txts-list (rest f&ds)))]))

; is-txt? : (String -> Boolean)
; produces #true if the file ends with "txt"
(check-expect (is-txt? "test.txt") #true)
(check-expect (is-txt? "test.mp3") #false)
(define (is-txt? fname)
  (string=? (substring fname (- (string-length fname) 3) (string-length fname)) "txt"))
