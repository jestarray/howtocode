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

(define ASSIGNMENT-NAME 'n-queens)
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

(@test "n-queens#1" "err" (n-queens 1) ((submission-eval) '(list (make-pos 0 0))) 1)
(@test "n-queens#2" "err" (n-queens 2) #false 1)
(@test "n-queens#3" "err" (n-queens 3) #false 1)
(@test "n-queens#4" "err" (n-queens 4) ((submission-eval) '(list (make-pos 3 2) (make-pos 2 0) (make-pos 1 3) (make-pos 0 1))) 1)
(@test "n-queens#5" "err" (n-queens 5) ((submission-eval) '(list (make-pos 4 3) (make-pos 3 1) (make-pos 2 4) (make-pos 1 2) (make-pos 0 0))) 1)
(@test "n-queens#6" "err" (n-queens 6) ((submission-eval) '(list (make-pos 5 4) (make-pos 4 2) (make-pos 3 0) (make-pos 2 5) (make-pos 1 3) (make-pos 0 1))) 1)

        ; MAX SCORE SHOULD BE (N / TOTAL-UNIT-TESTS)
        (set-test-max-score! 0)
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
