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

(define ASSIGNMENT-NAME 'filesystem-p1)
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

(check: :language 'lang/htdp-intermediate

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

(@test "count-files#1" "err" (count-files (make-dir "work" (list "resume.pdf" "cover.pdf"))) 2 1)
(@test "count-files#2" "err" (count-files (make-dir "scripts" (list "part1.rtf" "part2.rtf" "part3.rtf" "costume.png"))) 4 1)
(@test "count-files#3" "err" (count-files (make-dir "life" (list (make-dir "work" (list "resume.pdf" "cover.pdf")) (make-dir "school" (list "todo.txt"))))) 3 1)
(@test "count-files#4" "err" (count-files (make-dir "Documents" (list (make-dir "scripts" (list "part1.rtf" "part2.rtf" "part3.rtf" "costume.png")) "todo.txt" (make-dir "life" (list (make-dir "work" (list "resume.pdf" "cover.pdf")) (make-dir "school" (list "todo.txt"))))))) 8 1)

(@test "count-subdirs#1" "err" (count-subdirs (make-dir "scripts" (list "part1.rtf" "part2.rtf" "part3.rtf" "costume.png"))) 0 1)
(@test "count-subdirs#2" "err" (count-subdirs (make-dir "life" (list (make-dir "work" (list "resume.pdf" "cover.pdf")) (make-dir "school" (list "todo.txt"))))) 2 1)
(@test "count-subdirs#3" "err" (count-subdirs (make-dir "Documents" (list (make-dir "scripts" (list "part1.rtf" "part2.rtf" "part3.rtf" "costume.png")) "todo.txt" (make-dir "life" (list (make-dir "work" (list "resume.pdf" "cover.pdf")) (make-dir "school" (list "todo.txt"))))))) 4 1)
(@test "count-txts#1" "err" (count-txts (make-dir "Documents" (list (make-dir "scripts" (list "part1.rtf" "part2.rtf" "part3.rtf" "costume.png")) "todo.txt" (make-dir "life" (list (make-dir "work" (list "resume.pdf" "cover.pdf")) (make-dir "school" (list "todo.txt"))))))) 2 1)
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
