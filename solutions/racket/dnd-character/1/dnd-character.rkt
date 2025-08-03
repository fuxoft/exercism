#lang racket

(provide (struct-out character)
         ability
         make-character
         modifier)

(struct character
    (strength dexterity constitution intelligence wisdom charisma hitpoints))

(define (ability)
  (define lst (build-list 4 (lambda (x) (random 1 7))))
  (- (apply + lst) (apply min lst)))

(define (modifier value)
  (floor (/ (- value 10) 2)))

(define (make-character)
  (let ([con (ability)])
    (character (ability) (ability) con (ability) (ability) (ability) (+ 10 (modifier con)))))
