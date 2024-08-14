#lang scheme

(define (make-withdraw balance)
  (lambda (amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds")))

; make-withdraw can be used as follows
; to create two objects W1 and W2:

(define W1 (make-withdraw 100))
(define W2 (make-withdraw 100))

(equal? W1 W2)