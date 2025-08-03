#lang racket
(provide my-reverse)

(define (my-reverse s)
  (list->string (map (lambda (i) (string-ref s i)) (range (sub1 (string-length s)) -1 -1))))
