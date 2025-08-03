#lang racket

(provide recite)

(define (recite0 lst)
  (define this (~a "For want of a " (car lst) " the " (cadr lst) " was lost."))
  (if (null? (cddr lst))
      (list this)
      (cons this (recite0 (cdr lst)))))

(define (recite lst)
  (define result
        (if (>= (length lst) 2)
            (recite0 lst)
            '()))
  (if (null? lst)
      result
      (append result (list (~a "And all for the want of a " (car lst) ".")))))