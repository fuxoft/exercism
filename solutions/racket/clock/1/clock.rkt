#lang racket

(provide clock
         add
         subtract
         clock->string)

(define (clock h m)
  (modulo (+ (* 60 h) m) 1440))

(define (clock->string c)
  (define (tostr n)
    (string-append (if (n . <= . 9) "0" "") (number->string n)))
  (string-append (tostr (quotient c 60)) ":" (tostr (remainder c 60))))

(define (add c minutes)
  (clock 0 (+ c minutes)))

(define (subtract c minutes)
  (clock 0 (- c minutes)))
