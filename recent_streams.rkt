#lang scheme
(require racket/stream)

(define (stream-car s)(stream-first s))
(define (stream-cdr s)(stream-rest s))
(define (n-th s n)
  (if (= 1 n) (stream-car s)
      (n-th (stream-cdr s) (- n 1))))

"----------------------"
(define (int-starting-from n)
  (stream-cons n (int-starting-from (+ n 1))))

(define integers (int-starting-from 1))

(define (div? a b)(= 0 (remainder a b)))

(define (sieve s)
  (stream-cons (stream-car s)
               (sieve (stream-filter (lambda(x)(not (div? x (stream-car s)))) (stream-cdr s)))))

(define primes (sieve (int-starting-from 2)))

(n-th primes 1)
(n-th primes 2)
(n-th primes 5)


"##"
(define (add-streams s1 s2)
  (cond((null? s1) s2)
       ((null? s2) s1)
       (else (stream-cons (+(stream-car s1)(stream-car s2))
                          (add-streams (stream-cdr s1)(stream-cdr s2))))))
(define aa (stream-cons 1 (add-streams aa aa)))


(define fibs
  (stream-cons 0
               (stream-cons 1 (add-streams fibs (stream-cdr fibs)))))





"-----------------------------"


(define s1 (stream-cons 1 s1))

(define sn (stream-cons 1 (add-streams sn s1)))


(define ps (stream-cons 0 (add-streams ps sn)))

(define (hi s)
    (stream-cons (stream-car s)(add-streams (hi s)(stream-cdr s))))
      



(define kk (hi sn))
(n-th kk 1)
(n-th kk 2)
(n-th kk 3)
(n-th kk 5)
(n-th kk 6)



"-----------------"




(define a '(list a b \(\ \\0 \(\ ))

(define n0 (lambda()null))

(define (zero? x)(null? (x)))
