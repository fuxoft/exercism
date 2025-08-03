#lang racket

(provide triangle?)

(define (triangle? sides kind)
  (apply check (cons kind (sort sides <))))

(define (check kind a b c)
  (if (or (zero? (* a b c)) (< (+ a b) c))
    #f
    (match kind
           ['equilateral (= a b c)]
           ['isosceles (or (= a b) (= b c))]
           [_ (not (or (= a b) (= b c)))])))