#lang racket

(provide response-for)

(define (response-for prompt)
  (define str (string-trim prompt))
  (define (question? str)
    (equal? #\? (string-ref str (sub1 (string-length str)))))
  (cond [(and (equal? str (string-upcase str)) (not (equal? str (string-downcase str))))
         (if (question? str)
             "Calm down, I know what I'm doing!"
             "Whoa, chill out!")]
        [(equal? "" str) "Fine. Be that way!"]
        [(question? str) "Sure."]
        [else "Whatever."]))
