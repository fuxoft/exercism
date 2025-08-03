#lang racket

(provide proteins)

(define tr (hash "AUG" "Methionine"   
                 "UUU" "Phenylalanine"
                 "UUC" "Phenylalanine"
                 "UUA" "Leucine"
                 "UUG" "Leucine"
                 "UCU" "Serine"
                 "UCC" "Serine"
                 "UCA" "Serine"
                 "UCG" "Serine"
                 "UAU" "Tyrosine"
                 "UAC" "Tyrosine"
                 "UGU" "Cysteine"
                 "UGC" "Cysteine"
                 "UGG" "Tryptophan"
                 "UAA" #f
                 "UAG" #f
                 "UGA" #f))

(define (proteins strand)
  (define lasts #t)
  (for/list ([ind (in-range 0 (string-length strand) 3)]
             #:do [(define this (hash-ref tr (substring strand ind (+ ind 3))))]
             #:break (not this))
            this))