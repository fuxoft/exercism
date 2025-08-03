#lang racket

(provide create-queen
         can-attack?)

(struct queen (x y))

(define (create-queen row column)
  (unless (and (<= 0 row 7) (<= 0 column 7))
    (error))
  (queen row column))

(define (can-attack? w b)
  (let ([x1 (queen-x w)] [x2 (queen-x b)] [y1 (queen-y w)] [y2 (queen-y b)])
    (or
       (= x1 x2)
       (= y1 y2)
       (= (abs (- x1 x2)) (abs (- y1 y2))))))
