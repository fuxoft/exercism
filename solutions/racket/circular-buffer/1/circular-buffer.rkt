#lang racket

(provide circular-buffer%)

(define circular-buffer%
  (class object%
    (init capacity)
         
    (define max-size capacity)
    (define cells (make-vector capacity))
    (define size 0)
    (define newest 0)
    (define (wrap n) (modulo n max-size))
    (define (oldest) (wrap (- newest (sub1 size))))
    (define (full?) (= size max-size))

    (super-new)
         
    (define/public (write item)
                   (if (full?)
                       (error "buffer full")
                       (begin
                             (set! size (add1 size))
                             (set! newest (wrap (add1 newest)))
                             (vector-set! cells newest item))))
         
    (define/public (read)
                   (if (zero? size)
                       (error "buffer empty")
                       (begin0
                              (vector-ref cells (oldest))
                              (set! size (sub1 size)))))
    
    (define/public (clear)
                    (set! size 0))
         
    (define/public (overwrite item)
                   (if (full?)
                       (begin
                         (set! newest (wrap (add1 newest)))
                         (vector-set! cells newest item))
                       (write item)))))