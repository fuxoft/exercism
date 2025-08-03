#lang racket

(require racket/date)

(provide add-gigasecond)

(define (add-gigasecond datetime)
  (seconds->date (+ 1000000000 (date->seconds datetime))))