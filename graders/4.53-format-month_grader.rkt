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

(define ASSIGNMENT-NAME 'format-month)
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
        (!procedure format-month 2)

        ; MAX SCORE SHOULD BE (N / TOTAL-UNIT-TESTS)
        (set-test-max-score! 24)

(@test "1" "err" (format-month "January" "short") "Jan" 1)
(@test "2" "err" (format-month "February" "short") "Feb" 1)
(@test "3" "err" (format-month "March" "short") "Mar" 1)
(@test "4" "err" (format-month "April" "short") "Apr" 1)
(@test "5" "err" (format-month "May" "short") "May" 1)
(@test "6" "err" (format-month "June" "short") "Jun" 1)
(@test "7" "err" (format-month "July" "short") "Jul" 1)
(@test "8" "err" (format-month "August" "short") "Aug" 1)
(@test "9" "err" (format-month "September" "short") "Sep" 1)
(@test "10" "err" (format-month "October" "short") "Oct" 1)
(@test "11" "err" (format-month "November" "short") "Nov" 1)
(@test "12" "err" (format-month "December" "short") "Dec" 1)
(@test "13" "err" (format-month "January" "long") "January" 1)
(@test "14" "err" (format-month "February" "long") "February" 1)
(@test "15" "err" (format-month "March" "long") "March" 1)
(@test "16" "err" (format-month "April" "long") "April" 1)
(@test "17" "err" (format-month "May" "long") "May" 1)
(@test "18" "err" (format-month "June" "long") "June" 1)
(@test "19" "err" (format-month "July" "long") "July" 1)
(@test "20" "err" (format-month "August" "long") "August" 1)
(@test "21" "err" (format-month "September" "long") "September" 1)
(@test "22" "err" (format-month "October" "long") "October" 1)
(@test "23" "err" (format-month "November" "long") "November" 1)
(@test "24" "err" (format-month "December" "long") "December" 1)

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
