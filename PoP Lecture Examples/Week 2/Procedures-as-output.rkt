#lang scheme

(define square (λ (x) (* x x)))
(define cube   (λ (x) (* x x x)))
(define average (λ (x y) (/ (+ x y) 2)))
(define foo-1 (λ (f x) (average x (f x))))
(define foo-2 (λ (f) (λ (x) (average x (f x)))))


; alternatively
;1 (define (square x) (* x x))
;2 (define cube (λ (x) (* x x x)))
;3 (define (average x y) (/ (+ x y) 2))
;4 (define (foo-1 f x) (average x (f x)))
;5 (define (foo-2 f) (λ (x) (average x (f x)))) 
;6 (define (foo-2 f) (define (internal x) (average x (f x))) internal)

;5th expression is incorrect
;6th expression is the correct alternative expression for the foo-2 above.

; One needs to define the internal procedure and then return the procedure
; Whereas the lambda defines and automatically returns the procedure as well

