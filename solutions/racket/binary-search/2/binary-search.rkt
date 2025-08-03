#lang racket

(provide binary-search)

(define (binary-search array value)
  (binsearch array value 0 (sub1 (vector-length array))))

(define (binsearch vect val from to)
  (cond
   [(> from to) #f]
   [(= from to) (if (= (vector-ref vect from) val) from #f)]
   [else (let ([middle (quotient (+ from to) 2)])
           (if ((vector-ref vect middle) . < . val)
               (binsearch vect val (add1 middle) to)
               (binsearch vect val from middle)))]))
