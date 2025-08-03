#lang racket

(provide convert)

(define (convert number)
  (or (foldl (lambda (pair acc) (if (zero? (remainder number (car pair))) (string-append (or acc "") (cdr pair)) acc)) #f '((3 . "Pling") (5 . "Plang") (7 . "Plong"))) (number->string number)))