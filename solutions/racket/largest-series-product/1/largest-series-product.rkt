#lang racket

(provide largest-product)

(define (largest-product digits span)
  (define numbers (for/list ([ch digits]) (if (char-numeric? ch)
                                              (- (char->integer ch) 48)
                                              (error "not a digit"))))
  (cond
   [(> span (length numbers)) (error "span too large")]
   [(zero? span) 1]
   [else (apply max
             (for/list ([i (in-inclusive-range 0 (- (length numbers) span))])
                       (apply * (take (drop numbers i) span))))]))