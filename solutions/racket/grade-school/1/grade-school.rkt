#lang racket

(provide school%)

(define school%
  (class object%
    (define current-roster empty)
    (super-new)
    (define/public (roster)
                   (sort current-roster #:key car <))
    (define/public (grade want-grade)
                   (or
                     (for/or ([gr current-roster])
                             (if (equal? want-grade (car gr))
                                 (cdr gr)
                                 #f))
                                 empty))
    (define/public (add name gr)
                    (if (ormap (lambda (n) (member name n)) (map cdr current-roster))
                        #f
                        (begin
                          (set! current-roster (cons (cons gr (sort (cons name (grade gr)) string-ci<?)) (filter (lambda (g0) (not (equal? (car g0) gr))) current-roster)))
                           #t)))))
