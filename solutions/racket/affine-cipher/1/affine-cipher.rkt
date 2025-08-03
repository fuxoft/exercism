#lang racket
(require racket/contract)

(provide (contract-out
          [encode (string?
                   exact-nonnegative-integer?
                   exact-nonnegative-integer? . -> . string?)]
          [decode (string?
                   exact-nonnegative-integer?
                   exact-nonnegative-integer? . -> . string?)]))

(define (encode msg a b)
  (doit msg a b #t))

(define (decode msg a b)
  (doit msg a b #f))

(define (split5 lst)
  (if (<= (length lst) 5)
      lst
      (append (take lst 5) (list #\space) (split5 (drop lst 5)))))

(define (gcd x y)
  (if (= x y)
      x
      (if (> x y)
          (gcd (- x y) y)
          (gcd x (- y x)))))

(define (doit msg a b mode) ; mode #t = encode
  (define transl (make-hash))
  (when (> (gcd a 26) 1) (error))
  (for ([i (in-range 26)])
       (let ([ch1 (integer->char (+ 97 i))] [ch2 (integer->char (+ 97 (remainder (+ (* a i) b) 26)))])
         (if mode
             (hash-set! transl ch1 ch2)
             (hash-set! transl ch2 ch1))))
  (define (translate chr)
    (if (and (char>=? chr #\0) (char<=? chr #\9))
        chr
        (hash-ref transl (char-downcase chr) #f)))
  (define result '())
  (for ([ch msg])
       (define tr (translate ch))
       (when tr
         (set! result (append result (list tr)))))
  (list->string (if mode (split5 result) result)))