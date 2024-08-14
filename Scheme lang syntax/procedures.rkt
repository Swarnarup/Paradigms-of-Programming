#lang scheme

(lambda (x) (* x x))

((lambda (x) (* x x)) 5)

(define square (lambda (x) (* x x)))
square
(square 5)

(define fact
  (lambda (n op)
    (if (<= n 1)
        op
        (fact (- n 1) (* op n)))))

(fact 5 1)

(define do
  (lambda (this that)
    (this that)))


" ------ Reducing a list---------"

(define red
  (lambda (operator base_case lst)
    (if (null? lst)
        base_case
        (operator (car lst) (red operator base_case (cdr lst))))))

(red + 10 '(1 1 1 1))
(define map_square (lambda (ca rec_cd) (cons (* ca ca) rec_cd)))

(red map_square '() '(1 2 3 4))

" Filtering off numbers "
(define odd? (lambda (x) (= 1 (remainder x 2))))

(red (lambda (a b) (if (odd? a) (cons a b) b)) '() '(1 2 3 4 5 6))

" Length of list "
(red (lambda (a b) (+ 1 b)) 0 '(x y w z))

" Reversing List "
(red (lambda (a b) (append b (list a))) '() '(x y w z))