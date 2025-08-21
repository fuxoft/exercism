#lang racket

(provide balanced?)

(define (balanced? str)
  (define stack empty)
  (define parens (make-hash '((#\[ . #\]) (#\{ . #\}) (#\( . #\)))))
  (and
   (for/and ([char (string->list str)])
     (define found (hash-ref parens char #f))
     (if found
         (set! stack (cons found stack))
         (if (and (pair? stack) (equal? char (car stack)))
             (set! stack (cdr stack))
             (if (member char (hash-values parens)) #f #t))))
   (empty? stack)))