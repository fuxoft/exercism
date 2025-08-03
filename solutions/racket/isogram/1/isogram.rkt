#lang racket

(provide isogram?)

(define (isogram? s)
  (define hsh (make-hash))
  (for/and ([char s])
           (let ([chr (char-downcase char)])
             (if (and
                     (char-alphabetic? chr)
                  (hash-has-key? hsh chr))
                 #f
                 (begin (hash-set! hsh chr #t) #t)))))
