#lang racket

(provide etl)

(define (etl input)
  (define hsh (make-hash))
  (hash-for-each input
    (lambda (sc ltrs)
      (when (<= sc 0) (error))
      (for ([ltr ltrs])
           (hash-set! hsh (string-downcase ltr) sc))))
  hsh)
