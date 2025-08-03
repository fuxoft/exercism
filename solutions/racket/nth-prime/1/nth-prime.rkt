#lang racket

(provide nth-prime)

(define (prime? x)
  (if (= x 2)
      #t
      (not (for/or ([d (in-inclusive-range 2 (sqrt x))])
                 (zero? (modulo x d))))))

(define (nth-prime number)
  (if (< number 1)
      (raise)
      (let loop ([n number][prime 2])
        (if (prime? prime)
            (if (> n 1)
                (loop (sub1 n) (add1 prime))
                prime)
            (loop n (add1 prime))))))