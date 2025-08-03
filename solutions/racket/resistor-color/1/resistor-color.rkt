#lang racket

(provide color-code colors)

(define (list-item-index lst item [index 0])
  (if (eq? (car lst) item)
      index
      (list-item-index (cdr lst) item (add1 index))))

(define (color-code color)
  (list-item-index (colors) color))

(define (colors)
  '("black" "brown" "red" "orange" "yellow" "green" "blue" "violet" "grey" "white"))