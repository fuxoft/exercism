#lang racket
(provide grep)

(define (grep flags pattern files)
  (define multiple-files? (> (length files) 1))
  (define (flag? str) (member str flags))
  (define match-fun1
    (if (flag? "-x")
      equal?
      string-contains?))
  (define match-fun2
    (if (flag? "-i")
      (lambda (str substr) (match-fun1 (string-upcase str) (string-upcase substr)))
      match-fun1))
  (define match-fun (if (flag? "-v")
      (lambda (str substr) (not (match-fun2 str substr)))
      match-fun2))
  (define to-string-fun1 
    (if (flag? "-n")
        (lambda (filename line-n line) (string-append (number->string (add1 line-n)) ":" line))
        (lambda (filename line-n line) line)))
  (define to-string-fun
    (if multiple-files?
        (lambda (filename line-n line) (string-append filename ":" (to-string-fun1 filename line-n line)))
        to-string-fun1))
  (flatten
          (map (lambda (filename)
            (let ([text (port->lines (open-input-file filename))])
              (if (flag? "-l")
                (if (ormap (lambda (line) (match-fun line pattern)) text)
                  filename
                  empty)
                (for/list
                  ([line-n (in-range (length text))]
                    [line text]
                    #:when (match-fun line pattern))
                    (to-string-fun filename line-n line))))) files)))
