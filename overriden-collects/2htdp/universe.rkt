#lang racket

(require lang/prim)

(provide big-bang universe key=? key-event? mouse=? mouse-event?
         launch-many-worlds launch-many-worlds/proc
         LOCALHOST package? make-package
         bundle? make-bundle mail? make-mail
         stop-with? stop-with stop-with-w
         iworld? iworld=? iworld-name iworld1 iworld2 iworld3)

(provide-higher-order-primitive animate (create-scene))

(define (animate create-scene)
  (begin (for-each create-scene '(0 100 200))
         200))

(define-syntax-rule (big-bang e0 e ...)
  e0)

(define-syntax-rule (universe e0 e ...)
  e0)

(define (key=? k1 k2) (equal? k1 k2))

(define (key-event? k) (string? k))

(define (mouse=? m1 m2) (equal? m1 m2))

(define (mouse-event? m) (string? m))

(define-syntax-rule (launch-many-worlds e ...)
  (values e ...))

(define launch-many-worlds/proc
  (lambda thunks (apply values (map (lambda (thunk) (thunk)) thunks))))

(define LOCALHOST "127.0.0.1")

(define-struct package [world upload])

(define-struct bundle [universe mails disconnect])

(define-struct mail [iworld download])

(define-struct iworld [name])

(define (iworld=? iw1 iw2)
  (and (string=? (iworld-name iw1) (iworld-name iw2))
       (eqv? iw1 iw2)))

(define iworld1 (make-iworld "iworld1"))
(define iworld2 (make-iworld "iworld2"))
(define iworld3 (make-iworld "iworld3"))

(define-struct stop-with [w])
