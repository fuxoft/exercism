#lang racket

(provide acronym)

(define (acronym str)
  (list->string (map (lambda (wrd) (first (string->list wrd))) (string-split (string-replace (list->string (filter (lambda (ch) (or (char-alphabetic? ch) (char-whitespace? ch) (char=? ch #\-))) (string->list (string-upcase str)))) "-" " ")))))
