#lang racket
(require json)
; this script copies rkt files from starter and solution and places them in folders approriate for racket handin-servers architeture

(define curr-dir (current-directory))

(define starter-dir (build-path curr-dir "starter"))
(define solution-dir (build-path curr-dir "solutions"))
(define grader-dir (build-path curr-dir "graders"))

(define all-dirs (list starter-dir solution-dir grader-dir))


; (listof (listof paths))
; where (listof paths) is (list starter solution grader) paths
(define starter-n-grader
  (filter-map
   (lambda (path)
     (define ext (path-get-extension path))
     (cond [(and (bytes? ext) (bytes=? #".rkt" ext))
            (define fname (path->string (file-name-from-path path)))
            (define splits (string-split fname "-"))
            (define try-num (string->number (first splits)))
            ; ignore 0.0 to 2.3 because they do not have graders intentionally
            (if (and try-num (not (<= 0.0 try-num 2.9)))
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

;; Path | String -> (ListOfExp Boolean)
; (read-thing-from-file "/mnt/z/jestlearn_howtocode/writeups/solutions/12.01-bubble-points_solution.rkt")
(define (read-thing-from-file file-path)
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
  (call-with-input-file file-path read-thing))

; from: /usr/share/racket/pkgs/htdp-lib/lang/private/intermediate-plus.rkt
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
     struct?
     ))
(define isl-funcs
  '(
    andmap
    apply
    argmax
    argmin
    build-list
    build-string
    compose
    filter
    foldl
    foldr
    posn
    map
    memf
    ormap
    sort
    quicksort
    procedure?
    lambda
    local
    time
    ))
; from: /usr/share/racket/pkgs/htdp-lib/2htdp/image.rkt
(define htdp-image-fns
  '(
    overlay
    overlay/align
    overlay/offset
    overlay/align/offset
    overlay/xy

    underlay
    underlay/align
    underlay/offset
    underlay/align/offset
    underlay/xy

    beside
    beside/align

    above
    above/align

    crop
    crop/align
    rotate
    flip-horizontal
    flip-vertical
    color-frame
    frame
    place-image
    place-image/align
    place-images
    place-images/align
    put-image

    scale
    scale/xy

    circle
    ellipse
    wedge
    rectangle
    empty-scene
    square
    rhombus
    regular-polygon
    pulled-regular-polygon
    polygon
    star
    star-polygon
    radial-star
    triangle
    triangle/sss
    triangle/ssa
    triangle/sas
    triangle/ass
    triangle/aas
    triangle/asa
    triangle/saa
    isosceles-triangle
    right-triangle
    line
    add-line
    add-polygon
    add-curve
    add-solid-curve
    scene+line
    scene+polygon
    scene+curve
    text
    text/font

    image->color-list
    color-list->bitmap

    x-place?
    y-place?
    image?
    mode?
    angle?
    side-count?
    image-color?
    pen-style?
    pen-cap?
    pen-join?
    real-valued-posn?

    image-width
    image-height
    image-baseline

    put-pinhole
    clear-pinhole
    center-pinhole
    pinhole-x
    pinhole-y
    overlay/pinhole
    underlay/pinhole

    make-color
    make-pen
    make-pulled-point
    step-count?
    save-image
    save-svg-image

    freeze
    bitmap/url
    bitmap/file
    ))
(define bsl&image-funcs (append bsl-funcs isl-funcs htdp-image-fns))

; groups of files that have the starter, soul, and grader, all as existing files
(define has-start-sol-grader
  (filter-map
   (lambda (group)
     (cond
       [(((curry andmap) file-exists?) group) group]
       [else
        ; ignore 0.0 to 2.3 because they do not have graders intentionally
        (println (list (first group) "does not have one of: _starter/solution/grader"))
        #f])) starter-n-grader))

; create handin dirs and copy the graders to checker.rkt
(for ([group has-start-sol-grader])
  (define starter-path (first group))
  (define grader-path (third group))
  (define problem-name-and-number
    (first (string-split (path->string (file-name-from-path starter-path)) "_")))
  (define handin-problem-path
    (build-path gen-handin-dir problem-name-and-number))

  (make-directory* handin-problem-path)
  (copy-file grader-path (build-path handin-problem-path "checker.rkt") #t))

; List of file contents in s-expression/module form -> List<String>
; example:
; '(#%module-begin (define PNAME 'update-equip) (define-struct wep (name class damage)) -> '("wep-name" ...)
(define (hints-from-contents contents)
  (define (is-define-struct? defs)
    (findf
     (lambda (sym)
       (eq? sym 'define-struct))
     (if (list? defs) defs '())))
  (define all-structs (filter is-define-struct? contents))
  (define struct-accessor-funcs
    (flatten
     (map
      (lambda (dstructs)
        (define struct-name (second dstructs))
        (define struct-fields (third dstructs))
        ; Symbol Symbol -> String
        (define (make-accessor-string sname fname)
          (string-append
           (symbol->string sname)
           "-"
           (symbol->string fname)))
        (map ((curry make-accessor-string) struct-name) struct-fields)) all-structs)))
  ; remove the define-struct blocks
  ; because if (define-struct foo [second]), the hint will say to use "second" which is wrong
  (define no-define-structs
    (filter-not is-define-struct? contents))
  ; Symbol -> String | #f
  ; produces the string of the symbol if it is in "bsl&image-funcs"
  (define (bsl&img-funcs-to-string sym)
    (if (index-of bsl&image-funcs sym)
        (symbol->string sym)
        #f))
  (define bsl-hint-funcs
    (filter-map
     bsl&img-funcs-to-string
     (remove-duplicates (filter symbol? (flatten no-define-structs)))))
  (define all-hint-funts
    (append bsl-hint-funcs struct-accessor-funcs))
  all-hint-funts)

; create the hash for the json, where we make gather the funcs used as hints
(define valid-assignments&hints
  (map
   (lambda (group)
     (define starter-path (first group))
     (define problem-name-and-number
       (first (string-split (path->string (file-name-from-path starter-path)) "_")))
     (define solution-path (second group))
     (define-values (all-contents err?) (read-thing-from-file solution-path))
     (define contents (first (rest (rest (rest all-contents)))))
     (define all-hint-funts (hints-from-contents contents))
     (make-hash
      `((name ,@problem-name-and-number)
        (hints ,@all-hint-funts)))) has-start-sol-grader))

; List<String>
(define assignment-folders
  (filter-map
   (lambda (file-or-dir)
     (define full-path (build-path gen-handin-dir file-or-dir))
     (if (and (directory-exists? full-path)
              (not (bytes=? #"overriden-collects" (path->bytes file-or-dir))))
         (path->string file-or-dir)
         #f)) (directory-list gen-handin-dir)))

(define sorted-assignment-folders
  (sort
   assignment-folders
   (lambda (a b)
     (define num1 (string->number (first (string-split a "-"))))
     (define num2 (string->number (first (string-split b "-"))))
     (<= num1 num2))
   ))

(define config-file
  `((allow-new-users #t)
    (allow-change-info #t)
    (active-dirs (,@sorted-assignment-folders))
    (session-timeout 10)
    ))

(call-with-output-file
    (build-path gen-handin-dir "config.rktd")
  (lambda (out)
    (writeln config-file out)) #:exists 'replace)

; goes into jestlearn server
(call-with-output-file "VALID-ASSIGNMENTS.json"
  (lambda (out)
    (displayln
     (jsexpr->string
      (sort valid-assignments&hints
            (lambda (a b)
              (define name1 (hash-ref a 'name))
              (define name2 (hash-ref b 'name))
              (define num1 (string->number (first (string-split name1 "-"))))
              (define num2 (string->number (first (string-split name2 "-"))))
              ;(println (list num1 num2))
              (<= num1 num2)))) out)) #:exists 'replace)

(define overridden-collects-dir (build-path gen-handin-dir "overriden-collects"))
(delete-directory/files overridden-collects-dir #:must-exist? #f)
(copy-directory/files "./overriden-collects" overridden-collects-dir)