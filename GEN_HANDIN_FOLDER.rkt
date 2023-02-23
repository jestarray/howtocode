#lang racket
(require json)
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

(define gen-handin-dir (build-path curr-dir "../handin/htc-autograder"))

(make-directory* gen-handin-dir)

#;
(for ([file-or-dir (directory-list gen-handin-dir)])
; delete only directories
; todo: only delete and replace grader files?
; warn if a folder is not valid, e.g out of date because moved problem number or renamed
  (define full-path (build-path gen-handin-dir file-or-dir))
  (when (directory-exists? full-path)
    (delete-directory/files full-path #:must-exist? #f)
    ))

(define (read-thing-from-file f)
  (define (read-thing source)
    ;; Read some object from a source port.
    ;; Return two values: either the object read and #t,
    ;; or some exception object and #f if something went wrong.
    ;;
    ;; This tries to defang the reader but I am not sure it does enough
    (with-handlers ([exn? (lambda (e) (values e #f))])
      (call-with-default-reading-parameterization
       (thunk
        (parameterize ([read-accept-lang #t]
                       [read-accept-reader #t])
          (values (read source) #t))))))
  ;; read a thing from a file
  (call-with-input-file f read-thing))

(define bsl-funcs
  '(cond
     if
     and
     or
     *
     +
     -
     /
     <
     <=
     =
     >
     >=
     abs
     acos
     add1
     angle
     asin
     atan
     ceiling
     complex?
     conjugate
     cos
     cosh
     current-seconds
     denominator
     e
     even?
     exact->inexact
     exact?
     exp
     expt
     floor
     gcd
     imag-part
     inexact->exact
     inexact?
     integer->char
     integer-sqrt
     integer?
     lcm
     log
     magnitude
     make-polar
     make-rectangular
     max
     min
     modulo
     negative?
     number->string
     number->string-digits
     number?
     numerator
     odd?
     pi
     positive?
     quotient
     random
     rational?
     real-part
     real?
     remainder
     round
     sgn
     sin
     sinh
     sqr
     sqrt
     sub1
     tan
     zero?
     boolean->string
     boolean=?
     boolean?
     false?
     not
     symbol->string
     symbol=?
     symbol?
     append
     assoc
     assq
     caaar
     caadr
     caar
     cadar
     cadddr
     caddr
     cadr
     car
     cdaar
     cdadr
     cdar
     cddar
     cdddr
     cddr
     cdr
     cons
     cons?
     eighth
     empty?
     fifth
     first
     fourth
     length
     list
     list*
     list-ref
     list?
     make-list
     member
     member?
     memq
     memq?
     memv
     null
     null?
     range
     remove
     remove-all
     rest
     reverse
     second
     seventh
     sixth
     third
     make-posn
     posn-x
     posn-y
     posn?
     char->integer
     char-alphabetic?
     char-ci<=?
     char-ci<?
     char-ci=?
     char-ci>=?
     char-ci>?
     char-downcase
     char-lower-case?
     char-numeric?
     char-upcase
     char-upper-case?
     char-whitespace?
     char<=?
     char<?
     char=?
     char>=?
     char>?
     char?
     explode
     format
     implode
     int->string
     list->string
     make-string
     replicate
     string
     string->int
     string->list
     string->number
     string->symbol
     string-alphabetic?
     string-append
     string-ci<=?
     string-ci<?
     string-ci=?
     string-ci>=?
     string-ci>?
     string-contains-ci?
     string-contains?
     string-copy
     string-downcase
     string-ith
     string-length
     string-lower-case?
     string-numeric?
     string-ref
     string-upcase
     string-upper-case?
     string-whitespace?
     string<=?
     string<?
     string=?
     string>=?
     string>?
     string?
     substring
     image=?
     image?
     image-width
     image-height
     =~
     eof
     eof-object?
     eq?
     equal?
     equal~?
     eqv?
     error
     exit
     identity
     struct?))
(define *valid-assignments-and-hints* empty)

(for ([group starter-n-grader])
  (define has-start-sol-grader?
    (andmap
     (lambda (path)
       (define exists (file-exists? path))
       ; print what is missing
       (when (not exists)
         (println path))
       exists) group))
  (define has-start-sol?
    (andmap file-exists? (take group 2)))
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
         (define solution-path (second group))
         (define-values (contents err?) (read-thing-from-file solution-path))
         (define hint-funcs
           (filter-map
            (lambda (sym)
              (if (index-of bsl-funcs sym)
                  (symbol->string sym)
                  #f)) (remove-duplicates (filter symbol? (flatten contents)))))
         ; (println hint-funcs)
         (set! *valid-assignments-and-hints*
               (cons (make-hash
                      `((name ,@problem-name-and-number)
                        (hints ,@hint-funcs))) *valid-assignments-and-hints*))
         (copy-file grader-path (build-path problem-dir "checker.rkt") #t)]))

(define assignment-folders
  (filter-map
   (lambda (file-or-dir)
     (define full-path (build-path gen-handin-dir file-or-dir))
     (if (directory-exists? full-path)
         (path->string file-or-dir)
         #f)) (directory-list gen-handin-dir)))

(define config-file
  `((allow-new-users #t)
    (allow-change-info #t)
    (active-dirs (,@assignment-folders))))

(call-with-output-file
    (build-path gen-handin-dir "config.rktd")
  (lambda (out)
    (writeln config-file out)) #:exists 'replace)

; goes into jestlearn server
(call-with-output-file "VALID-ASSIGNMENTS.json"
  (lambda (out)
    (displayln (jsexpr->string
                (sort *valid-assignments-and-hints*
                      (lambda (a b)
                        (string<=? (hash-ref a 'name) (hash-ref b 'name))))) out)) #:exists 'replace)

(define overridden-collects-dir (build-path gen-handin-dir "overriden-collects"))
(delete-directory/files overridden-collects-dir #:must-exist? #f)
(copy-directory/files "./overriden-collects" overridden-collects-dir)