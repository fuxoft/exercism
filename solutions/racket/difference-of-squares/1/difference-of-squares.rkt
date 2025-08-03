#lang racket

(provide sum-of-squares square-of-sum difference)

(define (sum-of-squares number)
  (if (= 1 number)
      1
      (+ (* number number) (sum-of-squares (sub1 number)))))

(define (square-of-sum number)
  (expt (/ (* number (add1 number)) 2) 2))

(define (difference number)
  (- (square-of-sum number) (sum-of-squares number)))
