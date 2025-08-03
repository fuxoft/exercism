#lang racket

(provide score)

(define (score x y)
  (let ([d (sqrt (+ (* x x) (* y y)))])
    (cond
         [(<= d 1) 10]
         [(<= d 5) 5]
         [(<= d 10) 1]
         [else 0])))
