#lang racket

(provide square-root)

(define (square-root radicand [try (quotient radicand 2)])
  (if (= radicand (* try try))
      try
      (if ((* try try) . > . radicand)
          (square-root radicand (sub1 try))
          (square-root radicand (add1 try)))))
