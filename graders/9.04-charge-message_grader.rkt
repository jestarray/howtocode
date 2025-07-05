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

(define ASSIGNMENT-NAME 'charge-message)
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
        (!procedure charge-message 1)

        ; MAX SCORE SHOULD BE (N / TOTAL-UNIT-TESTS)
        (set-test-max-score! 3)
(@test "charge-message#1" "err" (charge-message (make-phone "iphone 10" (make-battery 100 5)))  "Fully charged" 1)
(@test "charge-message#2" "err" (charge-message (make-phone "Samsung Galaxy 24" (make-battery 50 5))) "50% 10 m until full" 1)
(@test "charge-message#3" "err" (charge-message (make-phone "Vivo" (make-battery 20 10))) "20% 8 m until full" 1)
        ; (println submission)
        )
(post:
 (add-score-to-report!)
 (write-report)
 (define username (first users))
 (define report-path (string-append "../" username "-report-#f.txt"))
 (define final-score (last (file->lines report-path)))

 (call-with-output-file "../grade"
   (lambda (out)
     ;remove 'Final Score:' and prettifies it to just a fraction
     (define prettify
       (string-replace
        (substring final-score 12 (string-length final-score))
        "out of"
        "/"))
     (define test-score (string-append "test-score: " prettify))
     (define htdp-score "\n | htdp-score: 0")
     (write-string (string-append test-score htdp-score) out)) #:exists 'replace))
