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

(define ASSIGNMENT-NAME 'bouncer)
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
        (!procedure process-bouncer 1)
        ; (!procedure next-light 1)

        ; MAX SCORE SHOULD BE (N / TOTAL-UNIT-TESTS)
        (set-test-max-score! 5)

;(define WIDTH 500)
;(define HEIGHT 400)
;(define LOGO (rectangle 50 50 "solid" "red"))

(@test "proess-bouncer#1" "err" (process-bouncer (make-bouncer 20 10 (rectangle 50 51 "solid" "red") 5 5)) ((submission-eval) '(make-bouncer 25 15 (rectangle 50 51 "solid" "red") 5 5)) 1)
; traveling left, hitting left edge
(@test "proess-bouncer#2" "err" (process-bouncer (make-bouncer -5 0 (rectangle 50 51 "solid" "red") -5 5)) ((submission-eval) '(make-bouncer 0 0 (rectangle 50 51 "solid" "red") 5 5)) 1)
; traveling right, hitting right edge
(@test "proess-bouncer#3" "err" (process-bouncer (make-bouncer (+ 500 9) 0 (rectangle 50 51 "solid" "red") 5 5)) ((submission-eval) '(make-bouncer (- 500 (image-width (rectangle 50 51 "solid" "red"))) 0 (rectangle 50 51 "solid" "red") -5 5)) 1)
; traveling up, hitting top edge
(@test "proess-bouncer#4" "err" (process-bouncer (make-bouncer 0 -5 (rectangle 50 51 "solid" "red") 5 -5)) ((submission-eval) '(make-bouncer 0 0 (rectangle 50 51 "solid" "red") 5 5)) 1)
; traveling down, hitting bottom edge
(@test "proess-bouncer#5" "err" (process-bouncer (make-bouncer 0 (+ 400 5) (rectangle 50 51 "solid" "red") 5 -5)) ((submission-eval) '(make-bouncer 0 (- 400 (image-height (rectangle 50 51 "solid" "red"))) (rectangle 50 51 "solid" "red") 5 5)) 1)


; copy & paste tests:
;(@test "proess-bouncer#1" "err" (process-bouncer (make-bouncer 20 10 LOGO 5 5)) ((submission-eval) '(make-bouncer 25 15 LOGO 5 5)) 1)
;; traveling left, hitting left edge
;(@test "proess-bouncer#2" "err" (process-bouncer (make-bouncer -5 0 LOGO -5 5)) ((submission-eval) '(make-bouncer 0 0 LOGO 5 5)) 1)
;; traveling right, hitting right edge
;(@test "proess-bouncer#3" "err" (process-bouncer (make-bouncer (+ WIDTH 9) 0 LOGO 5 5)) ((submission-eval) '(make-bouncer (- WIDTH (image-width LOGO)) 0 LOGO -5 5)) 1)
;; traveling up, hitting top edge
;(@test "proess-bouncer#4" "err" (process-bouncer (make-bouncer 0 -5 LOGO 5 -5)) ((submission-eval) '(make-bouncer 0 0 LOGO 5 5)) 1)
;; traveling down, hitting bottom edge
;(@test "proess-bouncer#5" "err" (process-bouncer (make-bouncer 0 (+ HEIGHT 5) LOGO 5 -5)) ((submission-eval) '(make-bouncer 0 (- HEIGHT (image-height LOGO)) LOGO 5 5)) 1)
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
