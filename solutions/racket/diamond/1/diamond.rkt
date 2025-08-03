#lang racket

(provide rows)

(define (rows high-char)
  (define (symmetrize lst)
    (append lst (cdr (reverse lst))))
  (define high-n (- (char->integer high-char) 64))
  (symmetrize
    (for/list ([i (in-range high-n)])
      (list->string
        (symmetrize 
          (build-list high-n (lambda (chn)
            (if (= chn (- high-n i 1))
              (integer->char (+ 65 i))
              #\space))))))))
