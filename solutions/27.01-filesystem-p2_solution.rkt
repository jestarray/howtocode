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
(define (file-temp fl)
  (...
   (file-name fl) ; String
   (file-size fl) ; Number
   (file-content fl))) ; String

(define-struct dir [name dirs files])
; Dir is (make-dir String ListOfDir ListOfFile)
(define DirSig (signature (DirOf String [ListOf Dir] [ListOf File]))) ; for checked sigs

; dir-temp : (Dir -> ???)
(define (dir-temp dtory)
  (...
   (dir-name dtory) ; String
   (list-dirs-temp (dir-dirs dtory)) ; ListOfDir
   (list-files-temp (dir-files dtory)))) ; ListOfFile

; A ListOfDir one of:
; – empty
; – (cons Dir ListOfDir)

; list-dirs-temp : (ListOfDir -> ???)
(define (list-dirs-temp dirs-lst)
  (cond
    [(empty? dirs-lst) ...]
    [else
     (... (dir-temp (first dirs-lst)) ; Dir
          (list-dirs-temp (rest dirs-lst)))]))

; A ListOfFile one of:
; – empty
; – (cons File ListOfFile)
; list-file-temp : (ListOfFile -> ???)
(define (list-files-temp files-lst)
  (cond
    [(empty? files-lst) ...]
    [else
     (... (file-temp (first files-lst)) ; File
          (list-files-temp (rest files-lst)))]))

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

(define part1 (make-file "part1.rtf" 99 ""))
(define part2 (make-file "part2.rtf" 52 ""))
(define part3 (make-file "part3.rtf" 17 ""))
(define costume (make-file "costume.png" 100 ""))

(define resume (make-file "resume.pdf" 8 ""))
(define cover (make-file "cover.pdf" 2 ""))

(define todo1 (make-file "todo.txt" 10 ""))
(define todo-school (make-file "todo.txt" 19 ""))

(define scripts (make-dir "scripts" empty (list part1 part2 part3 costume)))
(define work (make-dir "work" empty (list resume cover)))
(define school (make-dir "school" empty (list todo-school)))
(define life (make-dir "life" (list work school) empty))
(define documents (make-dir "Documents" (list scripts life) (list todo1)))


#|PROBLEM C:
Design the function "count-files" which consumes a Dir
and determines how many files a given Dir contains(including files in sub Dirs)
This is similar to the problem in "27.00 Problem C"
Challenge Refactor: Use abstract functions to implement the two helper functions
|#

(: count-files  (DirSig -> Number))
; produces the count of the files in the given dir
(check-expect (count-files work) 2)
(check-expect (count-files scripts) 4)
(check-expect (count-files life) 3)
(check-expect (count-files documents) 8)
(define (count-files dtory)
  (+
   (count-files-subdirs (dir-dirs dtory)) ; ListOfDir
   (count-files--list (dir-files dtory)))) ; ListOfFile

(: count-files-subdirs ([ListOf DirSig] -> Number))
(define (count-files-subdirs dirs-lst)
  (cond
    [(empty? dirs-lst) 0]
    [else
     (+ (count-files (first dirs-lst)) ; Dir
        (count-files-subdirs (rest dirs-lst)))]))

(: count-files--list ([ListOf FileSig] -> Number))
(define (count-files--list files-lst)
  (cond
    [(empty? files-lst) 0]
    [else
     (+ 1
        (count-files--list (rest files-lst)))]))

; abstract version
(define (count-files2 dtory)
  (+ (foldl (lambda (subdir base) (+ (count-files2 subdir) base)) 0 (dir-dirs dtory))
     (length (dir-files dtory))))

#|PROBLEM D:
Design "find?" The function consumes a Dir and String(the filename)
and determines whether or not the File with this name
occurs in the directory tree.
|#

(: find? (DirSig String -> Boolean))
; produces #true if the given filename exists in the directory tree
(check-expect (find? school "games.txt") #false)
(check-expect (find? school "todo.txt") #true)
(check-expect (find? documents "part1.rtf") #true)
(check-expect (find? documents "resume.pdf") #true)
(check-expect (find? documents "shopping.txt") #false)
(check-expect (find? life "cover.pdf") #true)
(define (find? dtory findname)
  (or
   (find-subdirs (dir-dirs dtory) findname) ; ListOfDir
   (has-file? (dir-files dtory) findname))) ; ListOfFile

; find-subdirs? : (ListOfDir String -> Boolean)
(check-expect (find-subdirs? empty "goodbye.lol") #false)
(check-expect (find-subdirs? (list scripts) "part2.rtf") #true)
(check-expect (find-subdirs? (list scripts life) "cover.pdf") #true)
(check-expect (find-subdirs? (list scripts life) "meow.png") #false)
(define (find-subdirs dirs-lst findname)
  (cond
    [(empty? dirs-lst) #false]
    [else
     (or (find? (first dirs-lst) findname) ; Dir
         (find-subdirs (rest dirs-lst) findname))]))

; has-file? : (ListOfFile String -> Boolean)
; produces #true if the given filename is in current list of files
(check-expect (has-file? empty "games.txt") #false)
(check-expect (has-file? (list part1 part2 part3) "part2.rtf") #true)
(check-expect (has-file? (list part1 part2 part3) "goodbye.rtf") #false)
(define (has-file? files-lst findname)
  (cond
    [(empty? files-lst) #false]
    [else
     (or (string=? (file-name (first files-lst)) findname) ; File
         (has-file? (rest files-lst) findname))]))

; abstract version
(define (find?2 dtory findname)
  (or
   (ormap (lambda (subdir) (find?2 subdir findname)) (dir-dirs dtory))
   (ormap (lambda (fl) (string=? (file-name fl) findname)) (dir-files dtory))))

#|PROBLEM E:
Design the function "show", which lists
the names of all files and directories in a given Dir.
HINT: You will need to use "append"
|#

(: show (DirSig -> [ListOf String]))
; lists all the names of all the files and directories in a given Dir
(check-expect (show life)
              (list "life" "work" "resume.pdf" "cover.pdf" "school" "todo.txt"))
(check-expect (show scripts)
              (list "scripts" "part1.rtf" "part2.rtf" "part3.rtf" "costume.png"))
(check-expect (show documents)
              (list "Documents" "scripts" "part1.rtf" "part2.rtf" "part3.rtf" "costume.png" "life" "work" "resume.pdf" "cover.pdf" "school" "todo.txt" "todo.txt"))
;(define (show dtory) empty)

(define (show dtory)
  (cons
   (dir-name dtory) ; String
   (append (list-curr-dirs (dir-dirs dtory)) ; ListOfDir -> ListOfString
           (list-curr-dir-files (dir-files dtory))))) ; ListOfFile -> ListOfString

; list-curr-dirs : (ListOfDir -> ListOfString)
(check-expect (list-curr-dirs empty) empty)
(check-expect (list-curr-dirs (list scripts life))
              (list
               "scripts"
               "part1.rtf"
               "part2.rtf"
               "part3.rtf"
               "costume.png"
               "life"
               "work"
               "resume.pdf"
               "cover.pdf"
               "school"
               "todo.txt"))
(define (list-curr-dirs dirs-lst)
  (cond
    [(empty? dirs-lst) empty]
    [else
     (append
      (show (first dirs-lst)) ; Dir
      (list-curr-dirs (rest dirs-lst)))]))

; list-curr-dir-files : (ListOfFile -> ListOfString)
(check-expect (list-curr-dir-files empty) empty)
(check-expect (list-curr-dir-files (list part1 part2 part3 costume))
              (list "part1.rtf" "part2.rtf" "part3.rtf" "costume.png"))
(define (list-curr-dir-files files-lst)
  (cond
    [(empty? files-lst) empty]
    [else
     (cons
      (file-name (first files-lst)) ; File
      (list-curr-dir-files (rest files-lst)))]))


#|PROBLEM F:
Design the function "total" which consumes a Dir and
produces the total size of all files in the ENTIRE directory tree.

Assume that storing a directory in a Dir structure costs 1 file storage unit.
Note that this is not the case in the real world filesystems
For example: (total life) -> (+ 1 1 8 2 19) = 31
|#

(: total (Dir -> Number))
; produces the total size of all files and dirs in the given directory
(check-expect (total school) 19)
(check-expect (total work) (+ 8 2))
(check-expect (total life) (+ 1 1 8 2 19))
(check-expect (total scripts) (+ 99 52 17 100))
(check-expect (total documents) (+ 1 1 1 1 99 52 17 100 8 2 19 10))

(define (total dtory)
  (+
   (total-subs (dir-dirs dtory)) ; ListOfDir -> Number
   (total-file-size (dir-files dtory)))) ; ListOfFile -> Number

; total-subs : (ListOfDir -> Number)
(check-expect (total-subs empty) 0)
(check-expect (total-subs (list scripts)) 269)
(check-expect (total-subs (list life)) 32)
(define (total-subs dirs-lst)
  (cond
    [(empty? dirs-lst) 0]
    [else
     (+ 1
      (total (first dirs-lst)) ; Dir
      (total-subs (rest dirs-lst)))]))

; total-file-size : (ListOfFile -> Number)
; produces the total size of all the given files
(check-expect (total-file-size empty) 0)
(check-expect (total-file-size (list part1 part2 resume)) (+ 99 52 8))
(define (total-file-size files-lst)
  (cond
    [(empty? files-lst) 0]
    [else
     (+
      (file-size (first files-lst)) ; File
      (total-file-size (rest files-lst)))]))

; abstract version
(define (total2 dtory)
  (+ (foldl (lambda (subdir base)
              (+ 1 (total2 subdir) base)) 0 (dir-dirs dtory))
     (foldl (lambda (fl base)
              (+ (file-size fl) base)) 0 (dir-files dtory))))
