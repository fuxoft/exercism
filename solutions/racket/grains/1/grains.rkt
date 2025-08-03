#lang racket

(provide square total)

(define (square a-square)
  (expt 2 (sub1 a-square)))

(define (total)
  (sub1 (square 65)))
