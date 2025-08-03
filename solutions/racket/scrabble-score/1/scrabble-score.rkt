#lang racket

(provide score)

(define (letter-score letter [score 1] [scores '("aeioulnrst" "dg" "bcmp" "fhvwy" "k" "" "" "jx" "" "qz")])
    (if (ormap (lambda (chr) (eq? chr letter)) (string->list (car scores)))
        score
        (letter-score letter (add1 score) (cdr scores))))

(define (score word)
  (apply + (map letter-score (string->list (string-downcase word)))))
