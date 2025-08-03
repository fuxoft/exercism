#lang racket

(provide number->eggs)

(define (number->eggs n)
  (if (zero? n)
      0
      (let-values ([(q r) (quotient/remainder n 2)])
        (+ r (number->eggs q)))))
