#lang racket

(provide armstrong-number?)

(define (armstrong-number? n)
  (let ([lst (string->list (number->string n))])
    (= n (apply + (map (lambda (ch) (expt (- (char->integer ch) 48) (length lst))) lst)))))
