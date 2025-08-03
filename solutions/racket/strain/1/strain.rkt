#lang racket

(provide keep discard)

(define (keep lst predicate)
  (myfilter predicate lst))

(define (discard lst predicate)
  (myfilter (lambda (x) (not (predicate x))) lst))

(define (myfilter pred lst)
  (define result '())
  (for ([item lst])
    (when (pred item)
      (set! result (append result (list item)))))
  result)