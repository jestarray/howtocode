#lang racket

; this script copies rkt files from starter and solution and places them in folders approriate for racket handin-servers architeture

(define curr-dir (current-directory))

(define starter-dir (build-path curr-dir "starter"))
(define solution-dir (build-path curr-dir "solutions"))
(define grader-dir (build-path curr-dir "graders"))

(define all-dirs (list starter-dir solution-dir grader-dir))


; (listof (listof paths))
; (list starter solution grader) paths
(define starter-n-grader
  (filter-map
   (lambda (path)
     (cond [(bytes=? #".rkt" (path-get-extension path))
            (define fname (path->string (file-name-from-path path)))
            (define splits (string-split fname "-"))
            (define try-num (string->number (first splits)))
            (if try-num
                (list (build-path starter-dir path)
                      (build-path solution-dir (string-replace fname "_starter.rkt" "_solution.rkt"))
                      (build-path grader-dir (string-replace fname "_starter.rkt" "_grader.rkt")))
                #f)]
           [else #f])) (directory-list starter-dir)))

(define gen-handin-dir (build-path curr-dir "HANDIN-GRADERS-TEMP"))

(delete-directory/files gen-handin-dir #:must-exist? #f)
(make-directory* gen-handin-dir)

(for ([group starter-n-grader])
  (define has-start-sol-grader?
    (andmap
     (lambda (path)
       (define exists (file-exists? path))
       ; print what is missing
       (when (not exists)
         (println path))
       exists) group))
  ; only copy those that have all 3 of the starter, solution or grader files for handin
  ; delete old generated directory
  (define starter-path (first group))
  (define problem-name-and-number
    (string-replace (path->string (file-name-from-path starter-path)) "_starter.rkt" ""))
  (define problem-dir
    (build-path gen-handin-dir
                problem-name-and-number))

  (cond [has-start-sol-grader?
         (make-directory* problem-dir)
         (define grader-path (third group))
         (copy-file grader-path (build-path problem-dir "checker.rkt") #t)]))