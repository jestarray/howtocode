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
4. A function template that processes this data❌

Functions:
1. Signature, purpose, stub ❌
2. Examples (aka check-expect/tests, elaborate the concrete) ❌
  2B. if the function consumes a list, make sure a list of 2 or longer is tested❌
3. Template(from data)?❌
4. Code body ❌
5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
|#

#|PROBLEM A:
Write the template for Dir and LOFD
and use it to solve the rest of the problems
|#

(define-struct dir [name content])
; A Dir is a structure:
;   (make-dir String LOFD)

; dir-temp : (Dir -> ???)
; TODO

; An LOFD (short for list of files and directories) is one of:
; – empty
; – (cons File LOFD)
; – (cons Dir LOFD)

; A File is a String. For now, it is just the filename

; lofd-temp : (LOFD -> ???)
; TODO

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
(define scripts (make-dir ...))
(define work (make-dir ...))
(define school (make-dir ...))
(define life (make-dir ...))
(define documents (make-dir ...))

#|PROBLEM C:
Design the function "count-files" which 
determines how many File's a given Dir contains(including Files in every subdirs)
For example:
Given: Documents , Produce: 8
|#

;(: count-files (Dir -> Number))
; TODO

#|PROBLEM D:
Design the function "count-subdirs" which determines how many directories
there are in a given Dir(including subdirs). Note that we EXCLUDE ourself! 
So the documents dir would have 4
|#

; (: count-subdirs (Dir -> Number))
; TODO

#|PROBLEM E:
Design the function "count-txts" which determines 
how many files with the ".txt" there are in a given Dir,
including those in subdirs
You can assume all files end in 3 letter extension names, e.g "pdf, txt, mp3, png"
|#

; (: count-txts (Dir -> Number))
; TODO
