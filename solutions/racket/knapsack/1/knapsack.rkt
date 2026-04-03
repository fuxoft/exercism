#lang racket

(provide item maximum-value)

(struct item (weight value) #:transparent)

(define (maximum-value maximum-weight items)
  (for/fold ([maxval 0] #:result maxval) ([combo (in-combinations items)])
    (values (if (<= (apply + (map item-weight combo)) maximum-weight)
      (let ([curval (apply + (map item-value combo))])
        (if (> curval maxval) curval maxval)) maxval))))
