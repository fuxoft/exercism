#lang racket

(provide high-scores%)

(define high-scores%
  (class object%
         (init-field values)
         (super-new)
         (define/public (scores)
                        values)
         (define/public (personal-best)
                        (apply max values))
         (define/public (latest)
                        (last values))
         (define/public (personal-top-three)
                        (take (sort values >) (min 3 (length values))))))


