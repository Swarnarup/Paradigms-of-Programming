#lang scheme

(define (factorial_1 n)
  (define (iter counter product)
    (if (> counter n)
        product
        (iter (+ counter 1) (* counter product))))
  (iter 1 1))

; Instead of passing arguments in the internal iterative loop, we could
; adopt a more imperative style by using explicit assignment to update
; the values of the variables product and counter:

(define (factorial_2 n)
  (let ((product 1)
        (counter 1))
    (define (iter)
      (if (> counter n)
          product
          (begin (set! counter (+ counter 1))
                 (set! product (* counter product))
                 (iter))))
    (iter)))