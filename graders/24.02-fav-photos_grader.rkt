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

(define ASSIGNMENT-NAME 'fav-photos)
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
        (!procedure to-frame 2)

        ; MAX SCORE SHOULD BE (N / TOTAL-UNIT-TESTS)
        (set-test-max-score! 3)

(@test "fav-photo#1" "err" (to-frame "fam" (list (make-photo "C:/photos/cat.png" "pets" #true) (make-photo "C:/photos/greatwall.png" "vacay" #true) (make-photo "C:/photos/self.png" "me" #true))) empty 1)
(@test "fav-photo#2" "err" (to-frame "me" (list (make-photo "C:/photos/cat.png" "pets" #true) (make-photo "C:/photos/greatwall.png" "vacay" #true) (make-photo "C:/photos/self.png" "me" #true))) ((submission-eval) '(make-photo "C:/photos/self.png" "me" #true)) 1)
(@test "fav-photo#3" "err" (to-frame "pets" (list (make-photo "C:/photos/cat.png" "pets" #true) (make-photo "C:/photos/greatwall.png" "vacay" #true) (make-photo "C:/photos/dog.png" "pets" #false))) ((submission-eval) '(make-photo "C:/photos/cat.png" "pets" #true)) 1)

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
