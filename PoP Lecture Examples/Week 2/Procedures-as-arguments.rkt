#lang scheme

; Compute sum of integers between a and b (inclusive)
(define (sum-integers a b)
  (if (> a b)
      0
      (+ a
         (sum-integers (+ a 1) b))))

; Compute sum of cubes of integers between a and b (inclusive)
(define (sum-cubes a b)
  (if (> a b)
      0
      (+ (* a a a)
         (sum-cubes (+ a 1) b))))

; Compute pi/8  using a formula
(define (pi-sum a b)
  (if (> a b)
    0
    (+ (/ 1.0 (* a (+ a 2)))
       (pi-sum (+ a 4) b))))


; Generalizing the concept of summation
; <sequence> denotes the sequence to generate successive terms
; <a> denotes the first index of the sequence
; <b> denotes the last index of the sequence
; <next> denotes the process to get the successor of <a>

(define (sum sequence a next b)
        (if (> a b)
          0
         (+ (sequence a)
         (sum sequence (next a) next b))))

(define (square x) (* x x))
(define (identity x) x)

(define (inc x) (+ x 2))

(define (sum-alternate-squares a b)
          (sum square a inc b))

(define (definite-integral f a b dx)
  (define (add-dx x)
          (+ x dx))
          (* (sum f (+ a (/ dx 2.0)) add-dx b) dx)
)


; Usage of lambda


(define (f x y)
  (define (f-helper a b)
    (+ (square a)
       (square b)
       (* a b)))
  (f-helper (+ x y)
            (* x y)))

(define (f_using_let x y)
  (let ((a (+ x y)) (b (* x y)))
     (+ (square a)
       (square b)
       (* a b)))
)