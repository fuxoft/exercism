#lang racket

(provide on-mercury
         on-venus
         on-earth
         on-mars
         on-jupiter
         on-saturn
         on-uranus
         on-neptune)

(define (on-mercury x)
  (fun x 0.2408467))

(define (on-venus x)
  (fun x 0.61519726))

(define (on-earth x)
  (fun x 1.0))

(define (on-mars x)
  (fun x 1.8808158))

(define (on-jupiter x)
  (fun x 11.862615))

(define (on-saturn x)
  (fun x 29.447498))

(define (on-uranus x)
  (fun x 84.016846))

(define (on-neptune x)
  (fun x 164.79132))

(define (fun x coeff)
  (/ x coeff 31557600))