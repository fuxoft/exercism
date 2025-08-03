#lang racket

(provide color-code)

(define (list-item-index lst item [index 0])
  (if (eq? (car lst) item)
      index
      (list-item-index (cdr lst) item (add1 index))))

(define (color-code color-list)
  (+ (* 10 (list-item-index (colors) (car color-list))) (list-item-index (colors) (cadr color-list))))

(define (colors)
  '("black" "brown" "red" "orange" "yellow" "green" "blue" "violet" "grey" "white"))
