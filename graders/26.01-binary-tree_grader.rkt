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

(define ASSIGNMENT-NAME 'binary-tree)
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
        (set-test-max-score! 12)

(@test "contains-bt?#1" "err"(contains-bt? #false -1) #false 1)
(@test "contains-bt?#2" "err"(contains-bt? (make-node 12 "an" (make-node 45 "li" (make-node 23 "bob" (make-node 2 "cy" #false #false) (make-node 7 "ed" #false #false)) #false) (make-node 4 "vy" (make-node 66 "zu" #false #false) (make-node 31 "he" #false (make-node 99 "mo" #false #false)))) -1) #false 1)
(@test "contains-bt?#3" "err"(contains-bt? (make-node 12 "an" (make-node 45 "li" (make-node 23 "bob" (make-node 2 "cy" #false #false) (make-node 7 "ed" #false #false)) #false) (make-node 4 "vy" (make-node 66 "zu" #false #false) (make-node 31 "he" #false (make-node 99 "mo" #false #false)))) 31) #true 1)
(@test "contains-bt?#4" "err"(contains-bt? (make-node 12 "an" (make-node 45 "li" (make-node 23 "bob" (make-node 2 "cy" #false #false) (make-node 7 "ed" #false #false)) #false) (make-node 4 "vy" (make-node 66 "zu" #false #false) (make-node 31 "he" #false (make-node 99 "mo" #false #false)))) 23) #true 1)
(@test "contains-bt?#6" "err"(contains-bt? (make-node 12 "an" (make-node 45 "li" (make-node 23 "bob" (make-node 2 "cy" #false #false) (make-node 7 "ed" #false #false)) #false) (make-node 4 "vy" (make-node 66 "zu" #false #false) (make-node 31 "he" #false (make-node 99 "mo" #false #false)))) 7) #true 1)
(@test "contains-bt?#1" "err"(contains-bt? (make-node 12 "an" (make-node 45 "li" (make-node 23 "bob" (make-node 2 "cy" #false #false) (make-node 7 "ed" #false #false)) #false) (make-node 4 "vy" (make-node 66 "zu" #false #false) (make-node 31 "he" #false (make-node 99 "mo" #false #false)))) 66) #true 1)
(@test "search-bt#1" "err"(search-bt 0 #false) #false 1)
(@test "search-bt#2" "err"(search-bt 0 (make-node 12 "an" (make-node 45 "li" (make-node 23 "bob" (make-node 2 "cy" #false #false) (make-node 7 "ed" #false #false)) #false) (make-node 4 "vy" (make-node 66 "zu" #false #false) (make-node 31 "he" #false (make-node 99 "mo" #false #false))))) #false 1)
(@test "search-bt#3" "err"(search-bt 99 (make-node 12 "an" (make-node 45 "li" (make-node 23 "bob" (make-node 2 "cy" #false #false) (make-node 7 "ed" #false #false)) #false) (make-node 4 "vy" (make-node 66 "zu" #false #false) (make-node 31 "he" #false (make-node 99 "mo" #false #false))))) "mo" 1)
(@test "search-bt#4" "err"(search-bt 2 (make-node 12 "an" (make-node 45 "li" (make-node 23 "bob" (make-node 2 "cy" #false #false) (make-node 7 "ed" #false #false)) #false) (make-node 4 "vy" (make-node 66 "zu" #false #false) (make-node 31 "he" #false (make-node 99 "mo" #false #false))))) "cy" 1)
(@test "search-bt#5" "err"(search-bt 7 (make-node 12 "an" (make-node 45 "li" (make-node 23 "bob" (make-node 2 "cy" #false #false) (make-node 7 "ed" #false #false)) #false) (make-node 4 "vy" (make-node 66 "zu" #false #false) (make-node 31 "he" #false (make-node 99 "mo" #false #false))))) "ed" 1)
(@test "search-bt#6" "err"(search-bt 66 (make-node 12 "an" (make-node 45 "li" (make-node 23 "bob" (make-node 2 "cy" #false #false) (make-node 7 "ed" #false #false)) #false) (make-node 4 "vy" (make-node 66 "zu" #false #false) (make-node 31 "he" #false (make-node 99 "mo" #false #false))))) "zu" 1)
(@test "in-order#1" "err"(in-order (make-node 12 "an" (make-node 45 "li" (make-node 23 "bob" (make-node 2 "cy" #false #false) (make-node 7 "ed" #false #false)) #false) (make-node 4 "vy" (make-node 66 "zu" #false #false) (make-node 31 "he" #false (make-node 99 "mo" #false #false))))) (list 2 23 7 45 12 66 4 31 99) 1)
(@test "lookup-bst#1" "err"(lookup-bst (make-node 63 "an" (make-node 29 "li" (make-node 15 "bob" (make-node 10 "cy" #false #false) (make-node 24 "ed" #false #false)) #false) (make-node 89 "vy" (make-node 77 "zu" #false #false) (make-node 95 "he" #false (make-node 99 "mo" #false #false)))) -1) #false 1)
(@test "lookup-bst#2" "err"(lookup-bst (make-node 63 "an" (make-node 29 "li" (make-node 15 "bob" (make-node 10 "cy" #false #false) (make-node 24 "ed" #false #false)) #false) (make-node 89 "vy" (make-node 77 "zu" #false #false) (make-node 95 "he" #false (make-node 99 "mo" #false #false)))) 99) "mo" 1)
(@test "lookup-bst#3" "err"(lookup-bst (make-node 63 "an" (make-node 29 "li" (make-node 15 "bob" (make-node 10 "cy" #false #false) (make-node 24 "ed" #false #false)) #false) (make-node 89 "vy" (make-node 77 "zu" #false #false) (make-node 95 "he" #false (make-node 99 "mo" #false #false)))) 10) "cy" 1)
(@test "lookup-bst#4" "err"(lookup-bst (make-node 63 "an" (make-node 29 "li" (make-node 15 "bob" (make-node 10 "cy" #false #false) (make-node 24 "ed" #false #false)) #false) (make-node 89 "vy" (make-node 77 "zu" #false #false) (make-node 95 "he" #false (make-node 99 "mo" #false #false)))) 24) "ed" 1)
(@test "lookup-bst#5" "err"(lookup-bst (make-node 63 "an" (make-node 29 "li" (make-node 15 "bob" (make-node 10 "cy" #false #false) (make-node 24 "ed" #false #false)) #false) (make-node 89 "vy" (make-node 77 "zu" #false #false) (make-node 95 "he" #false (make-node 99 "mo" #false #false)))) 77) "zu" 1)
;(@test "#1" "err"(create-bst #false 9 "hy") (make-node 7 "hy" #false #false) 1)

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
