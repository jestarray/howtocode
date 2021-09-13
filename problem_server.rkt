#lang racket
(require "gen_exercises.rkt")

(require web-server/servlet-dispatch
         web-server/http
         (prefix-in pathprocedure: web-server/dispatchers/dispatch-pathprocedure))

;TEXT/HTML-MIME-TYPE
;APPLICATION/JSON-MIME-TYPE
;(string->bytes/utf-8 (gen-exercise (exercise-num)))

(define (display-page req)
  (response
   200 #"OK"
   (current-seconds)
   APPLICATION/JSON-MIME-TYPE
   (list (header #"Access-Control-Allow-Origin" #"*"))
   (λ (op)
     (write-bytes (gen-exercise (exercise-num))
                  op))))

(serve/launch/wait
 #:port 8080
 (λ (quit)
   (pathprocedure:make "/e1"
                       display-page)))
