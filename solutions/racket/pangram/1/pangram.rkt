#lang racket

(provide pangram?)

(define (pangram? sentence)
  (define ltrs (mutable-set))
  (for ([chr sentence])
       (when (char-alphabetic? chr)
           (set-add! ltrs (char-downcase chr))))
  (= 26 (set-count ltrs)))