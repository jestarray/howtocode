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

(define ASSIGNMENT-NAME 'psettings)
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

(check: :language 'lang/htdp-intermediate-lambda

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
;(@test "#1" "err"(create-bst #false 9 "hy") (make-node 7 "hy" #false #false) 1)

(@test "count-toggles#1" "err" (count-toggles display) 1 1)
(@test "count-toggles#2" "err" (count-toggles (make-menu "Mobile Networks" (list (make-cmd "Data Roaming" #false) (make-cmd "Allow 5G service" #false)))) 2 1)
(@test "count-toggles#3" "err" (count-toggles (make-menu "Connection" (list (make-cmd "Wifi" #false) (make-cmd "Bluetooth" #false) (make-cmd "Airplane Mode" #false) (make-menu "Mobile Networks" (list (make-cmd "Data Roaming" #false) (make-cmd "Allow 5G service" #false))) (make-menu "Data Usage" (list (make-cmd "Data Saver" #false)))))) 6 1)
(@test "count-toggles#4" "err" (count-toggles (make-menu "Settings" (list (make-menu "Connection" (list (make-cmd "Wifi" #false) (make-cmd "Bluetooth" #false) (make-cmd "Airplane Mode" #false) (make-menu "Mobile Networks" (list (make-cmd "Data Roaming" #false) (make-cmd "Allow 5G service" #false))) (make-menu "Data Usage" (list (make-cmd "Data Saver" #false))))) (make-menu "Display" (list (make-cmd "Adaptive Brightness" #false)))))) 7 1)

(@test "has-setting?#1" "err" (has-setting? (make-menu "Settings" (list (make-menu "Connection" (list (make-cmd "Wifi" #false) (make-cmd "Bluetooth" #false) (make-cmd "Airplane Mode" #false) (make-menu "Mobile Networks" (list (make-cmd "Data Roaming" #false) (make-cmd "Allow 5G service" #false))) (make-menu "Data Usage" (list (make-cmd "Data Saver" #false))))) (make-menu "Display" (list (make-cmd "Adaptive Brightness" #false))))) "data usage") #true 1)
(@test "has-setting?#2" "err" (has-setting? (make-menu "Settings" (list (make-menu "Connection" (list (make-cmd "Wifi" #false) (make-cmd "Bluetooth" #false) (make-cmd "Airplane Mode" #false) (make-menu "Mobile Networks" (list (make-cmd "Data Roaming" #false) (make-cmd "Allow 5G service" #false))) (make-menu "Data Usage" (list (make-cmd "Data Saver" #false))))) (make-menu "Display" (list (make-cmd "Adaptive Brightness" #false))))) "Data usage") #true 1)
(@test "has-setting?#3" "err" (has-setting? (make-menu "Settings" (list (make-menu "Connection" (list (make-cmd "Wifi" #false) (make-cmd "Bluetooth" #false) (make-cmd "Airplane Mode" #false) (make-menu "Mobile Networks" (list (make-cmd "Data Roaming" #false) (make-cmd "Allow 5G service" #false))) (make-menu "Data Usage" (list (make-cmd "Data Saver" #false))))) (make-menu "Display" (list (make-cmd "Adaptive Brightness" #false))))) "wifi") #true 1)
(@test "has-setting?#4" "err" (has-setting? (make-menu "Settings" (list (make-menu "Connection" (list (make-cmd "Wifi" #false) (make-cmd "Bluetooth" #false) (make-cmd "Airplane Mode" #false) (make-menu "Mobile Networks" (list (make-cmd "Data Roaming" #false) (make-cmd "Allow 5G service" #false))) (make-menu "Data Usage" (list (make-cmd "Data Saver" #false))))) (make-menu "Display" (list (make-cmd "Adaptive Brightness" #false))))) "Wifi") #true 1)
(@test "has-setting?#5" "err" (has-setting? (make-menu "Settings" (list (make-menu "Connection" (list (make-cmd "Wifi" #false) (make-cmd "Bluetooth" #false) (make-cmd "Airplane Mode" #false) (make-menu "Mobile Networks" (list (make-cmd "Data Roaming" #false) (make-cmd "Allow 5G service" #false))) (make-menu "Data Usage" (list (make-cmd "Data Saver" #false))))) (make-menu "Display" (list (make-cmd "Adaptive Brightness" #false))))) "ultra fast charging") #false 1)

(@test "find-path#1" "err" (find-path (make-menu "Connection" (list (make-cmd "Wifi" #false) (make-cmd "Bluetooth" #false) (make-cmd "Airplane Mode" #false) (make-menu "Mobile Networks" (list (make-cmd "Data Roaming" #false) (make-cmd "Allow 5G service" #false))) (make-menu "Data Usage" (list (make-cmd "Data Saver" #false))))) "hidden") empty 1)
(@test "find-path#2" "err" (find-path (make-menu "Connection" (list (make-cmd "Wifi" #false) (make-cmd "Bluetooth" #false) (make-cmd "Airplane Mode" #false) (make-menu "Mobile Networks" (list (make-cmd "Data Roaming" #false) (make-cmd "Allow 5G service" #false))) (make-menu "Data Usage" (list (make-cmd "Data Saver" #false))))) "Connection") (list "Connection") 1)
(@test "find-path#3" "err" (find-path (make-menu "Settings" (list (make-menu "Connection" (list (make-cmd "Wifi" #false) (make-cmd "Bluetooth" #false) (make-cmd "Airplane Mode" #false) (make-menu "Mobile Networks" (list (make-cmd "Data Roaming" #false) (make-cmd "Allow 5G service" #false))) (make-menu "Data Usage" (list (make-cmd "Data Saver" #false))))) (make-menu "Display" (list (make-cmd "Adaptive Brightness" #false))))) "Connection") (list "Settings" "Connection") 1)

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
