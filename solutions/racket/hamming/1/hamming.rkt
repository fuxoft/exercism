#lang racket

(provide hamming-distance)

(define (hamming-distance source target)
  (foldl (lambda (x y sum) (if (equal? x y) sum (add1 sum))) 0
                (string->list source) (string->list target)))
