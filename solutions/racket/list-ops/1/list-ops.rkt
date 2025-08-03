#lang racket

(provide my-length
         my-reverse
         my-map
         my-filter
         my-fold
         my-append 
         my-concatenate)

(define (my-length sequence)
  (if (empty? sequence)
      0
      (add1 (my-length (cdr sequence)))))

(define (my-map operation sequence)
  (if (empty? sequence)
      empty
      (cons (operation (car sequence)) (my-map operation (cdr sequence)))))

(define (my-filter operation? sequence)
  (if (empty? sequence)
      empty
      (if (operation? (car sequence))
          (cons (car sequence) (my-filter operation? (cdr sequence)))
          (my-filter operation? (cdr sequence)))))

(define (my-fold operation accumulator sequence)
  (if (empty? sequence)
      accumulator
      (my-fold operation (operation (car sequence) accumulator) (cdr sequence))))

(define (my-reverse sequence)
  (my-fold (lambda (item acc) (cons item acc)) empty sequence))

(define (my-append sequence1 sequence2)
  (my-fold (lambda (item acc) (cons item acc)) sequence2 (my-reverse sequence1)))

(define (my-concatenate l)
  (my-fold my-append '() (my-reverse l)))