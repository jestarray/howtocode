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

(define ASSIGNMENT-NAME 'employees)
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
        (!procedure raise-wages 2)
        (!procedure filter-role 2)
        (!procedure count-roles 2)

        ; MAX SCORE SHOULD BE (N / TOTAL-UNIT-TESTS)
        (set-test-max-score! 7)

(@test "raise-wages#1" "err" (raise-wages (list (make-employee "bob lee" 20 "Junior")) 4) ((submission-eval) '(list (make-employee "bob lee" 24 "Junior"))) 1)
(@test "raise-wages#2" "err" (raise-wages (list (make-employee "bob lee" 20 "Junior") (make-employee "don ri" 30 "Junior")) 8) ((submission-eval) '(list (make-employee "bob lee" 28 "Junior") (make-employee "don ri" 38 "Junior"))) 1)

;(list (make-employee "jack tar" 30 "Manager") (make-employee "anna yu" 25 "Senior"))

(@test "filter-role#1" "err" (filter-role zero-interns "Intern") empty 1)
(@test "filter-role#2" "err" (filter-role (list (make-employee "ava ryan" 32 "Manager") (make-employee "jess smith" 19 "Intern") (make-employee "anna yu" 25 "Senior")) "Intern") ((submission-eval) '(list (make-employee "jess smith" 19 "Intern"))) 1)
(@test "filter-role#3" "err" (filter-role (list (make-employee "ava ryan" 32 "Manager") (make-employee "jack tar" 30 "Manager") (make-employee "anna yu" 25 "Senior")) "Manager") ((submission-eval) '(list (make-employee "ava ryan" 32 "Manager") (make-employee "jack tar" 30 "Manager"))) 1)
(@test "count-roles#1" "err" (count-roles (list (make-employee "ava ryan" 32 "Manager") (make-employee "jack tar" 30 "Manager") (make-employee "anna yu" 25 "Senior")) "Manager") 2 1)
(@test "count-roles#2" "err" (count-roles (list (make-employee "ava ryan" 32 "Manager") (make-employee "jack tar" 30 "Manager")) "Intern") 0 1)

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
(cons "AB+" (cons "AB-" (cons "A+"  (cons "A-"  (cons "B+"  (cons "B-"  (cons "O+" (cons "O-" empty))))))))