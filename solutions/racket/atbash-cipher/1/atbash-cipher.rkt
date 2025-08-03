#lang racket

(provide encode decode)

(define (encode m)
  (list->string (split5 (code-list m))))

(define (decode m)
  (list->string (code-list m)))

(define (split5 lst)
  (if (<= (length lst) 5)
      lst
      (append (take lst 5) (list #\space) (split5 (drop lst 5)))))

(define (code-list str)
  (filter (lambda (ch) (or (char-alphabetic? ch) (char-numeric? ch))) (map (lambda (ch) (if (char-alphabetic? ch) (integer->char (- 219 (char->integer ch))) ch)) (string->list (string-downcase str)))))

