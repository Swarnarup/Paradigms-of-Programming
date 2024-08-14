#lang scheme

(define (make-decrementer balance)
  (lambda (amount)
    (- balance amount)))

(define D1 (make-decrementer 100))
(define D2 (make-decrementer 100))

(D1 10)
(D2 10)

; D1 and D2 could be considered same,
; because any value of x, (D1 x) = (D2 x)

; Same procedure using set!
(define (make-decrementer-2 balance)
  (lambda (amount)
    (set! balance (- balance amount)) balance))

(define D3 (make-decrementer-2 100))
(define D4 (make-decrementer-2 100))
; D3 and D4 could be considered same at this point and
; should be allowed to use either of them interchangeably.
; However, the existence of set! in the language
; make us question whether we can replace every instance of D3 with D4
; and vice-versa without loss of meaning.

(D3 10)
; Now D3 and D4 would be considered different,
; because (D3 x) \= (D4 x) for several values of x
; Therefore, D3 and D4 now cannot be used interchangeably.

(D3 20)
(D4 20)


