#lang racket

(provide nucleotide-counts)

(define (nucleotide-counts nucleotides)
  (define hsh (make-hash '([#\A . 0] [#\C . 0] [#\G . 0] [#\T . 0])))
  (for ([chr nucleotides])
       (if (hash-has-key? hsh chr)
           (hash-update! hsh chr add1)
           (error)))
  (sort (hash->list hsh) (lambda (a b) (char<? (car a) (car b)))))
