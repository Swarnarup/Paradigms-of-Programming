#lang scheme
(define balance 100)
(define (withdraw amount)
  (if (>= balance amount)
      (begin (set! balance (- balance amount))
             balance)
      "Insufficient funds"))

#|
In functional programming, balance would be considered
a place-holder for the number 100
With the ability to update its value using set!,
balance stops being a just a place-holder and
starts having an identity of its own.
balance becomes a computational object.
|#

; In the aforementioned piece of code, one can
; circumvent the use of withdraw procedure and
; directly update the balance using set!

(define new-withdraw
  (let ((balance 100))
    (lambda (amount)
      (if (>= balance amount)
          (begin (set! balance (- balance amount))
                 balance)
          "Insufficient funds"))))

; In new-withdraw, we make balance object internal
; to the procedure and thereby avoid the problem
; which withdraw procedure faced.


(define obj1 new-withdraw)
(define obj2 new-withdraw)

(equal? obj1 obj2)
