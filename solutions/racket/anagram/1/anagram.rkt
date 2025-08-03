#lang racket

(provide anagrams-for)

(define (anagrams-for subject candidates)
  (let ([subj (string->list (string-downcase subject))])
    (filter (lambda (cand0)
              (let ([cand (string->list (string-downcase cand0))])
                (if (equal? cand subj)
                    #f
                    (equal? (sort cand char<?) (sort subj char<?))))) candidates)))
