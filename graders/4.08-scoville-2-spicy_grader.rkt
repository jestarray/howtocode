#lang s-exp handin-server/checker

(require handin-server/grading-utils
         handin-server/sandbox
         racket/runtime-path
         racket/file
         racket/list
         racket/string
         (only-in racket/list remove-duplicates)
         )

(define-runtime-path here ".")
(define-values (base final dir?) (split-path (simplify-path here)))

(define ASSIGNMENT-NAME 'scoville->spicy)
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
        (!procedure scoville->spicy 1)

        ; MAX SCORE SHOULD BE (N / TOTAL-UNIT-TESTS)
        (set-test-max-score! 17)

(define NOT-SPICY "Not Spicy")
(define MILD "Mild")
(define MEDIUM "Medium")
(define HOT "Hot")
(define EXTRA-HOT "Extra Hot")
(define EXTREMELY-HOT "Extremely Hot")

(@test "1" "err" (scoville->spicy 0) NOT-SPICY 1)
(@test "2" "err" (scoville->spicy 50) NOT-SPICY 1)
(@test "3" "err" (scoville->spicy 99) NOT-SPICY 1)
(@test "4" "err" (scoville->spicy 100) MILD 1)
(@test "5" "err" (scoville->spicy 1000) MILD 1)
(@test "6" "err" (scoville->spicy 2499)  MILD 1)
(@test "7" "err" (scoville->spicy 2500)  MEDIUM 1)
(@test "8" "err" (scoville->spicy 5000) MEDIUM 1)
(@test "9" "err" (scoville->spicy 29999) MEDIUM 1)
(@test "10" "err" (scoville->spicy 30000)  HOT 1)
(@test "11" "err" (scoville->spicy 50000) HOT 1)
(@test "12" "err" (scoville->spicy 99999) HOT 1)
(@test "13" "err" (scoville->spicy 100000)  EXTRA-HOT 1)
(@test "14" "err" (scoville->spicy 150000) EXTRA-HOT 1)
(@test "15" "err" (scoville->spicy 299999) EXTRA-HOT 1)
(@test "16" "err" (scoville->spicy 300000)  EXTREMELY-HOT 1)
(@test "17" "err" (scoville->spicy 999999)  EXTREMELY-HOT 1)

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
