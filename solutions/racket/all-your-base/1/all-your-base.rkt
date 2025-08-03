#lang racket

(provide rebase)

(define (rebase list-digits in-base out-base)
  (if (or (< in-base 2) (< out-base 2) (ormap (lambda (x) (or (< x 0) (>= x in-base))) list-digits))
      #f
      (let ([dec (foldl (lambda (digit acc) (+ digit (* acc in-base))) 0 list-digits)])
        (define (to-out num)
          (let-values ([(q r) (quotient/remainder num out-base)])
                (if (zero? q)
                    (list r)
                    (append (to-out q) (list r)))))
        (to-out dec))))