#lang racket

(provide to-rna)

(define trans (apply hash (string->list "GCCGTAAU")))

(define (to-rna dna)
  (list->string (for/list ([chr dna]) (hash-ref trans chr))))