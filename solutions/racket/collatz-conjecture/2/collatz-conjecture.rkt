#lang racket

(provide collatz)

(define (collatz n)
  (if (and (>= n 1) (exact-integer? n)) (do-col n 0) (error)))

(define (do-col n steps)
  (if (= n 1)
      steps
      (do-col (if (even? n) (quotient n 2) (+ n n n 1)) (add1 steps))))
