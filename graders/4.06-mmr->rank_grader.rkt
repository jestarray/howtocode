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

(define ASSIGNMENT-NAME 'mmr->rank)
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
        (!procedure mmr->rank 1)

        ; MAX SCORE SHOULD BE (N / TOTAL-UNIT-TESTS)
        (set-test-max-score! 14)
(define BRONZE "Bronze")
(define SILVER "Silver")
(define GOLD "Gold")
(define PLATINUM "Platinum")
(define DIAMOND "Diamond")

(@test "1" "err" (mmr->rank 0) BRONZE 1)
(@test "2" "err" (mmr->rank 500) BRONZE 1)
(@test "3" "err" (mmr->rank 1149) BRONZE 1)
(@test "4" "err" (mmr->rank 1150) SILVER 1)
(@test "5" "err" (mmr->rank 1200) SILVER 1)
(@test "6" "err" (mmr->rank 1499) SILVER 1)
(@test "7" "err" (mmr->rank 1500) GOLD 1)
(@test "8" "err" (mmr->rank 1600) GOLD 1)
(@test "9" "err" (mmr->rank 1849) GOLD 1)
(@test "10" "err" (mmr->rank 1850) PLATINUM 1)
(@test "11" "err" (mmr->rank 2000) PLATINUM 1)
(@test "12" "err" (mmr->rank 2199) PLATINUM 1)
(@test "13" "err" (mmr->rank 2200) DIAMOND 1)
(@test "14" "err" (mmr->rank 3000) DIAMOND 1)

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
