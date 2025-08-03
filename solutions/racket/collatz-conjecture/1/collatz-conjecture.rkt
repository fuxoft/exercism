#lang racket

(provide collatz)

(define (collatz n)
  (if (or (< n 1) (not (= n (floor n)))) (error) (do-col n 0)))

(define (do-col n steps)
  (if (= n 1)
      steps
      (do-col (if (even? n) (quotient n 2) (+ n n n 1)) (add1 steps))))
