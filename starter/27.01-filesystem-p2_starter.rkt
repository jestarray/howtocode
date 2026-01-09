#lang htdp/isl+
(define PNAME 'filesystem-p2)
#| Data definitions:
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete

1. Data Description✅
   1B. if using define-struct, write all accessor signatures✅
2. Interpretation✅
3. Data Examples❌
4. A function template that processes this data❌

Functions:
1. Signature, purpose, stub ❌
2. Examples (aka check-expect/tests, elaborate the concrete) ❌
  2B. if the function consumes a list, make sure a list of 2 or longer is tested❌
3. Template(from data)?❌
4. Code body ❌
5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
|#

; ############################################################################

#|PROBLEM A:
Carrying on from filesystem-p1, we have changed the data definitions!
Files have much more than just their names, they have size, contents, etc.
So we've expanded/rewrote our data definitions

File is now a struct
Dir now stores the directories and files into two DIFFERENT lists
Constrast this to 27.00-filesystem-p1 where "LOFD" stored both Files and Dirs

Write the template for File, Dir, ListOfDir, and ListOfFile
|#
(define-struct file [name size content])
; File is (make-file String Number String)
(define FileSig (signature (FileOf String Number String))) ; for checked sigs
; represents a file on  your computer

; file-temp : (File -> ???)
; TODO

(define-struct dir [name dirs files])
; Dir is (make-dir String ListOfDir ListOfFile)
(define DirSig (signature (DirOf String [ListOf Dir] [ListOf File]))) ; for checked sigs

; dir-temp : (Dir -> ???)
; TODO

; A ListOfDir one of:
; – empty
; – (cons Dir ListOfDir)

; list-dirs-temp : (ListOfDir -> ???)
; TODO

; A ListOfFile one of:
; – empty
; – (cons File ListOfFile)
; list-file-temp : (ListOfFile -> ???)
; TODO

#|
HIERARCHIAL TREE DIAGRAM(A):
Note that brackets "[]" are directories

                                     [Documents]
               ___________________________|___________________________
              /                           |                           \
             /                            |                            \
       [scripts]                  "todo.txt"(10)                     [life]
    _______|________________                                     ______|______
   /    /      \            \                                   /             \
  /    /        \            \                                 /               \
 /    |          \            \                             [work]           [school]
 |    |           |            \                           /      \              |
 |    |           |             |                         /        \             |
 |    |           |      "costume.png"(100)      "resume.pdf"(8) "cover.pdf"(2)  |
 |    |      "part3.rtf"(17)                                              "todo.txt"(19)
 |    "part2.rtf"(52)
 "part1.rtf"(99)

SIDEBAR TREE DIAGRAM(A):

Documents/
├── scripts/
│   ├── part1.rtf (99)
│   ├── part2.rtf (52)
│   ├── part3.rtf (17)
│   └── costume.png (100)
├── todo.txt (10)
└── life/
    ├── work/
    │   ├── resume.pdf (8)
    │   └── cover.pdf (2)
    └── school/
        └── todo.txt (19)
|#

#|PROBLEM B:
Translate the above diagram of a directory structure into code
with "make-dir" and "make-file"

NOTICE: Next to the names are "(numbers)", which is the "size" of the file
Note: We're ignoring the contents of a file, so just make them an empty string ""
|#

(define part1 (make-file ...))
(define part2 ...)
(define part3 ...)
(define costume ...)

(define resume ...)
(define cover ...)

(define todo1 ...)
(define todo-school ...)

(define scripts (make-dir ...))
(define work ...)
(define school ...)
(define life ...)
(define documents ...)


#|PROBLEM C:
Design the function "count-files" which consumes a Dir
and determines how many files a given Dir contains
This is similar to the problem in "27.00 Problem C"
Challenge Refactor: Use abstract functions to implement the two helper functions
|#

; (: count-files  (DirSig -> Number))
; TODO

#|PROBLEM D:
Design "find?" The function consumes a Dir and String(the filename)
and determines whether or not the File with this name
occurs in the directory tree.
|#

#|PROBLEM E:
Design the function "show", which lists
the names of all files and directories in a given Dir.
HINT: You will need to use "append"
|#

; (: show (DirSig -> [ListOf String]))
; lists all the names of all the files and directories in a given Dir
;(check-expect (show life)
;              (list "life" "work" "resume.pdf" "cover.pdf" "school" "todo.txt"))



#|PROBLEM F:
Design the function "total" which consumes a Dir and
produces the total size of all files in the ENTIRE directory tree.

Assume that storing a directory in a Dir structure costs 1 file storage unit.
Note that this is not the case in the real world filesystems
For example: (total life) -> (+ 1 1 8 2 19) = 31
|#
