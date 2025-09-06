#lang racket
(provide solve)
(define (solve puzzle)
  (define words (regexp-match* #px"[[:upper:]]+" puzzle))
  (define all-letters
    (for/fold ([letter-list empty] #:result (reverse letter-list))
              ([word (in-list words)])
      (values (for/fold ([reversed-letter-list letter-list] #:result reversed-letter-list)
                        ([letter (in-list (string->list word))])
                (values (if (member letter reversed-letter-list) reversed-letter-list (cons letter reversed-letter-list)))))))
  (define can-be-zero (make-vector (length all-letters) #t))
  (define sums (make-vector (length all-letters) 0))
  (do ([remaining-words words (cdr remaining-words)])
    ((empty? remaining-words))
    (let* ([add-or-sub (if (empty? (cdr remaining-words)) - +)]
           [word (car remaining-words)]
           [letters (string->list word)])
      (when (> (length words) 1) (vector-set! can-be-zero (index-of all-letters (car letters)) #f))
      (do ([remaining-letters (reverse letters) (cdr remaining-letters)]
           [multiplier 1 (* 10 multiplier)])
        ((empty? remaining-letters))
        (let ([letter-index (index-of all-letters (car remaining-letters))])
          (vector-set! sums letter-index (add-or-sub (vector-ref sums letter-index) multiplier))))))
  (let ([solution (for/or ([combi (in-combinations (range 10) (length all-letters))])
                    (define has-zero (member 0 combi))
                    (for/or ([current (in-permutations combi)])
                      (if (and has-zero (not (vector-ref can-be-zero (index-of current 0)))) ;has zero at 1st position?
                          #f
                          (if (zero? (for/sum ([sums-item (in-vector sums)] [current-item (in-list current)]) (* sums-item current-item))) current #f))))])
    (if solution (for/list ([letter all-letters] [val solution]) (cons (string letter) val)) empty)))