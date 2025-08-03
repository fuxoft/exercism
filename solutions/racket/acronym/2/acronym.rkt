#lang racket

(provide acronym)

(define (filt ch)
  (or (char-alphabetic? ch) (char-whitespace? ch) (char=? ch #\-)))

(define (acronym str)
  (list->string (map (lambda (wrd) (first (string->list wrd)))
                     (string-split (string-replace (list->string (filter filt (string->list (string-upcase str)))) "-" " ")))))
