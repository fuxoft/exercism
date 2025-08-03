(defpackage :all-your-base
  (:use :cl)
  (:export :rebase))

(in-package :all-your-base)

(defun rev-to-int (digs base)
  (if (= 1 (length digs))
      (car digs)
      (+ (car digs) (* base (rev-to-int (cdr digs) base)))
  )
)

(defun rev-int-to-base (num base)
  (if (< num base)
      (list num)
      (cons (mod num base) (rev-int-to-base (floor (/ num base)) base))
  )
)

(defun rebase (list-digits in-base out-base)
  (cond 
    ((<= in-base 1) NIL)
    ((<= out-base 1) NIL)
    ((some (lambda (n) (or (>= n in-base) (< n 0))) list-digits) NIL)
    ((eq list-digits NIL) '(0))
    (t (reverse (rev-int-to-base (rev-to-int (reverse list-digits) in-base) out-base)))
  )
)
