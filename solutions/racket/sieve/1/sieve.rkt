#lang racket

(provide primes)

(define (primes limit)
  (define primes-vect (make-vector (sub1 limit) #t))
  (define (clear i)
    (vector-set! primes-vect (- i 2) #f))
  (define (check i)
    (vector-ref primes-vect (- i 2)))
  (for ([index (in-inclusive-range 2 limit)])
       (when (check index)
         (let loop ([current index])
           (set! current (+ current index))
           (when (<= current limit)
             (clear current)
             (loop current)))))
  (for/list ([index (in-inclusive-range 2 limit)] #:when (check index)) index))
