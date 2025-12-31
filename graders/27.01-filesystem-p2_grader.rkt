#lang s-exp handin-server/checker

(require handin-server/grading-utils
         handin-server/sandbox
         racket/runtime-path
         racket/file
         racket/list
         racket/string
         2htdp/image
         (only-in racket/list remove-duplicates)
         )

(define-runtime-path here ".")
(define-values (base final dir?) (split-path (simplify-path here)))

(define ASSIGNMENT-NAME 'filesystem-p2)
(define markup-prefix ";;> ")

(define-runtime-path override "../overridden-collects/")

(pre:
 (sandbox-path-permissions
  (list*
   (list 'exists "/usr/lib/ssl")
   (list 'exists "/etc/ssl/")
   (list 'exists (current-directory))
   (sandbox-path-permissions)))
 (sandbox-override-collection-paths (list override)))

(check: :language 'lang/htdp-intermediate-lambda

        :requires '(2htdp/image 2htdp/universe)
        :eval? #t
        :output (string-append (symbol->string ASSIGNMENT-NAME) ".rkt")
        :create-text? #t
        :textualize? #f ;;raises exception for submissions that are not all text
        :maxwidth #f
        :coverage? #f


        #| (update-submission-timestamp!)
        (add-header-line! (string-append "Timestamp: "
                                         (get-submission-timestamp)
                                         "\n")) |#
        ;(add-report-line! (get-submission-timestamp))
        (!test PNAME ASSIGNMENT-NAME) ; EVERY FILE MUST HAVE THIS ONTOP OF FILE
        ;(!procedure blue-eyed-linage? 1)

        ; MAX SCORE SHOULD BE (N / TOTAL-UNIT-TESTS)
        (set-test-max-score! 8)
;(@test "#1" "err"(create-bst #false 9 "hy") (make-node 7 "hy" #false #false) 1)

(@test "count-files#1" "err" (count-files (make-dir "work" empty (list (make-file "resume.pdf" 8 "") (make-file "cover.pdf" 2 "")))) 2 1)
(@test "count-files#2" "err" (count-files (make-dir "scripts" empty (list (make-file "part1.rtf" 99 "") (make-file "part2.rtf" 52 "") (make-file "part3.rtf" 17 "") (make-file "costume.png" 100 "")))) 4 1)
(@test "count-files#3" "err" (count-files (make-dir "life" (list (make-dir "work" empty (list (make-file "resume.pdf" 8 "") (make-file "cover.pdf" 2 ""))) (make-dir "school" empty (list (make-file "todo.txt" 19 "")))) empty)) 3 1)
(@test "count-files#4" "err" (count-files (make-dir "Documents" (list (make-dir "scripts" empty (list (make-file "part1.rtf" 99 "") (make-file "part2.rtf" 52 "") (make-file "part3.rtf" 17 "") (make-file "costume.png" 100 ""))) (make-dir "life" (list (make-dir "work" empty (list (make-file "resume.pdf" 8 "") (make-file "cover.pdf" 2 ""))) (make-dir "school" empty (list (make-file "todo.txt" 19 "")))) empty)) (list (make-file "todo.txt" 10 "")))) 8 1)

(@test "find?#1" "err" (find? (make-dir "school" empty (list (make-file "todo.txt" 19 ""))) "games.txt") #false 1)
(@test "find?#2" "err" (find? (make-dir "school" empty (list (make-file "todo.txt" 19 ""))) "todo.txt") #true 1)
(@test "find?#3" "err" (find? (make-dir "Documents" (list (make-dir "scripts" empty (list (make-file "part1.rtf" 99 "") (make-file "part2.rtf" 52 "") (make-file "part3.rtf" 17 "") (make-file "costume.png" 100 ""))) (make-dir "life" (list (make-dir "work" empty (list (make-file "resume.pdf" 8 "") (make-file "cover.pdf" 2 ""))) (make-dir "school" empty (list (make-file "todo.txt" 19 "")))) empty)) (list (make-file "todo.txt" 10 ""))) "part1.rtf") #true 1)
(@test "find?#4" "err" (find? (make-dir "Documents" (list (make-dir "scripts" empty (list (make-file "part1.rtf" 99 "") (make-file "part2.rtf" 52 "") (make-file "part3.rtf" 17 "") (make-file "costume.png" 100 ""))) (make-dir "life" (list (make-dir "work" empty (list (make-file "resume.pdf" 8 "") (make-file "cover.pdf" 2 ""))) (make-dir "school" empty (list (make-file "todo.txt" 19 "")))) empty)) (list (make-file "todo.txt" 10 ""))) "resume.pdf") #true 1)
(@test "find?#5" "err" (find? (make-dir "Documents" (list (make-dir "scripts" empty (list (make-file "part1.rtf" 99 "") (make-file "part2.rtf" 52 "") (make-file "part3.rtf" 17 "") (make-file "costume.png" 100 ""))) (make-dir "life" (list (make-dir "work" empty (list (make-file "resume.pdf" 8 "") (make-file "cover.pdf" 2 ""))) (make-dir "school" empty (list (make-file "todo.txt" 19 "")))) empty)) (list (make-file "todo.txt" 10 ""))) "shopping.txt") #false 1)
(@test "find?#6" "err" (find? (make-dir "life" (list (make-dir "work" empty (list (make-file "resume.pdf" 8 "") (make-file "cover.pdf" 2 ""))) (make-dir "school" empty (list (make-file "todo.txt" 19 "")))) empty) "cover.pdf") #true 1)

(@test "show#1" "err" (show (make-dir "life" (list (make-dir "work" empty (list (make-file "resume.pdf" 8 "") (make-file "cover.pdf" 2 ""))) (make-dir "school" empty (list (make-file "todo.txt" 19 "")))) empty)) (list "life" "work" "resume.pdf" "cover.pdf" "school" "todo.txt") 1)
(@test "show#2" "err" (show (make-dir "scripts" empty (list (make-file "part1.rtf" 99 "") (make-file "part2.rtf" 52 "") (make-file "part3.rtf" 17 "") (make-file "costume.png" 100 "")))) (list "scripts" "part1.rtf" "part2.rtf" "part3.rtf" "costume.png") 1)
(@test "show#3" "err" (show (make-dir "Documents" (list (make-dir "scripts" empty (list (make-file "part1.rtf" 99 "") (make-file "part2.rtf" 52 "") (make-file "part3.rtf" 17 "") (make-file "costume.png" 100 ""))) (make-dir "life" (list (make-dir "work" empty (list (make-file "resume.pdf" 8 "") (make-file "cover.pdf" 2 ""))) (make-dir "school" empty (list (make-file "todo.txt" 19 "")))) empty)) (list (make-file "todo.txt" 10 "")))) (list "Documents" "scripts" "part1.rtf" "part2.rtf" "part3.rtf" "costume.png" "life" "work" "resume.pdf" "cover.pdf" "school" "todo.txt" "todo.txt") 1)

(@test "total#1" "err" (total (make-dir "school" empty (list (make-file "todo.txt" 19 "")))) 19 1)
(@test "total#2" "err" (total (make-dir "work" empty (list (make-file "resume.pdf" 8 "") (make-file "cover.pdf" 2 "")))) (+ 8 2) 1)
(@test "total#3" "err" (total (make-dir "life" (list (make-dir "work" empty (list (make-file "resume.pdf" 8 "") (make-file "cover.pdf" 2 ""))) (make-dir "school" empty (list (make-file "todo.txt" 19 "")))) empty)) (+ 1 1 8 2 19) 1)
(@test "total#4" "err" (total (make-dir "Documents" (list (make-dir "scripts" empty (list (make-file "part1.rtf" 99 "") (make-file "part2.rtf" 52 "") (make-file "part3.rtf" 17 "") (make-file "costume.png" 100 ""))) (make-dir "life" (list (make-dir "work" empty (list (make-file "resume.pdf" 8 "") (make-file "cover.pdf" 2 ""))) (make-dir "school" empty (list (make-file "todo.txt" 19 "")))) empty)) (list (make-file "todo.txt" 10 "")))) (+ 99 52 17 100 10 8 2 19 1 1 1 1) 1)
        ; (println submission)
        )
(post:
 (add-score-to-report!)
 (write-report)
 (define username (first users))
 (define report-path (string-append "../" username "-report-#f.txt"))
 (define final-score (last (file->lines report-path)))

 (call-with-output-file "../grade" (lambda (out)
                                     ;remove 'Final Score:' and prettifies it to just a fraction
                                     (define prettify
                                       (string-replace
                                        (substring final-score 12 (string-length final-score))
                                        "out of"
                                        "/"))
                                     (define test-score (string-append "test-score: " prettify))
                                     (define htdp-score "\n | htdp-score: 0")
                                     (write-string (string-append test-score htdp-score) out)) #:exists 'replace))
