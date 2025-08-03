#lang racket

(provide to-roman)

(define vals
  '((1000 . "M") (900 . "CM") (500 . "D") (400 . "CD") (100 . "C") (90 . "XC") (50 . "L") (40 . "XL") (10 . "X") (9 . "IX") (5 . "V") (4 . "IV") (1 . "I")))

(define (to-roman number)
  (apply string-append (map
                        (lambda (pair)
                          (define rep (quotient number (car pair)))
                          (set! number (- number (* rep (car pair))))
                          (apply string-append (make-list rep (cdr pair)))) vals)))