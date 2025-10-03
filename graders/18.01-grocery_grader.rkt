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

(define ASSIGNMENT-NAME 'grocery)
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
        (!procedure total-price 1)
        (!procedure filter-price 2)
        (!procedure restock 2)

        ; MAX SCORE SHOULD BE (N / TOTAL-UNIT-TESTS)
        (set-test-max-score! 6)

;(@test "update-tank" "err" (update-tank (make-tank 20 2)) ((submission-eval) '(make-tank (+ 20 2) 2)) 1)
(@test "total-price#0" "err" (total-price empty) 0 1)
(@test "total-price#1" "err" (total-price (list (make-grocery "a" 1.0 1) (make-grocery "b" 2.0 1) (make-grocery "c" 4.0 1))) 7.0 1)

(@test "filter-price#0" "err" (filter-price empty 2) empty 1)
(@test "filter-price#1" "err" (filter-price (list (make-grocery "a" 1.0 1) (make-grocery "b" 2.0 1) (make-grocery "c" 4.0 1)) 2) ((submission-eval) '(list (make-grocery "a" 1.0 1) (make-grocery "b" 2.0 1))) 1)


(@test "restock#0" "err" (restock empty 2) empty 1)
(@test "restock#1" "err" (restock (list (make-grocery "a" 1.0 1) (make-grocery "b" 2.0 2)) 1) ((submission-eval) '(list (make-grocery "a" 1.0 2) (make-grocery "b" 2.0 3))) 1)
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