#lang racket

(provide list-allergies allergic-to?)

(define foods '("eggs" "peanuts" "shellfish" "strawberries" "tomatoes" "chocolate" "pollen" "cats"))

(define (list-allergies score)
  (filter identity (for/list ([i (in-naturals)] [food foods])
       (if (zero? (bitwise-and score (expt 2 i))) #f food))))

(define (allergic-to? str score)
  (> (bitwise-and score (expt 2 (index-of foods str))) 0))