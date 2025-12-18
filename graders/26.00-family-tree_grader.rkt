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

(define ASSIGNMENT-NAME 'family-tree)
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
        ;(!procedure count-persons 1)
        ;(!procedure average-age 2)
        ;(!procedure everyones-eye-colors 1)
        ;(!procedure has-blue-eyed-ancestor? 1)

        ; MAX SCORE SHOULD BE (N / TOTAL-UNIT-TESTS)
        (set-test-max-score! 12)

(@test "blue-eyed-linage?#1" "err" (blue-eyed-linage? carl) #false 1)
(@test "blue-eyed-linage?#2" "err" (blue-eyed-linage? carl) #false 1)
(@test "count-persons#1" "err" (count-persons carl) 1 1)
(@test "count-persons#2" "err" (count-persons adam) 3 1)
(@test "count-persons#3" "err" (count-persons gus) 5 1)

(@test "average-age#1" "err" (average-age carl 2000)
              (/ (- 2000 1938) 1) 1)
(@test "average-age#2" "err" (average-age adam 2000)
              (/ (+ (- 2000 1962)
                    (- 2000 1938)
                    (- 2000 1938)) 3) 1)

(@test "everyones-eye-colors#1" "err" (everyones-eye-colors carl) (list "green") 1)
(@test "everyones-eye-colors#2" "err" (everyones-eye-colors adam) (list "red" "green" "green") 1)
(@test "everyones-eye-colors#3" "err" (everyones-eye-colors gus) (list "brown" "blue" "green" "green" "pink") 1)

(@test "blue-eyed-ancestor?#1" "err" (has-blue-eyed-ancestor? eva) #false 1)
(@test "blue-eyed-ancestor?#2" "err" (has-blue-eyed-ancestor? gus) #true 1)
; (@test "do-to-all#3" "err" (do-to-all sqr (list 2 4)) (list 4 16) 1)
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
