#lang racket

(provide leap-year?)

(define (leap-year? year)
  (let ([div? (lambda (n) (zero? (modulo year n)))])
    (if (div? 100) (div? 400) (div? 4))))