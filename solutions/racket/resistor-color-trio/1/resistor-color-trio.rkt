#lang racket

(provide color-code)

(define (color-code color-list)
  (define number
    (* (+ (* 10 (list-item-index (colors) (car color-list))) (list-item-index (colors) (cadr color-list))) (expt 10 (list-item-index (colors) (caddr color-list)))))
  (let loop [(prefixes '("giga" "mega" "kilo" "" "")) (multiplier 1000000000)]
    (define safemult (max 1 multiplier))
    (if (and (>= number multiplier) (zero? (remainder number safemult)))
        (string-append (number->string (/ number safemult)) " " (car prefixes) "ohms")
        (loop (cdr prefixes) (quotient multiplier 1000)))))

(define (colors)
  '("black" "brown" "red" "orange" "yellow" "green" "blue" "violet" "grey" "white"))

(define (list-item-index lst item [index 0])
  (if (eq? (car lst) item)
      index
      (list-item-index (cdr lst) item (add1 index))))
