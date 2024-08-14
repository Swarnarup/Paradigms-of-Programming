#lang scheme

(define lst '(a b c))

(car (cdr lst))
(cadr lst)
(cddr lst)

(cadr '((1 2) (4 5) (6 7)))

(define oplist (list + 1 2))

(define do
  (lambda (this that)
    (this that)))

((car oplist) 1 2 3)


(cons '(1 2 3) 4)
(append '(1 2 3) 4)
(cons '(1 2 3) '(4 5))
(append '(1 2 3) '(4 5))


(cons '+ (cons 2 (cons 3 '())))
(cons + (cons 2 (cons 3 '())))
(list 2 (+ 2 3))
(quote (2 (+ 2 3)))
'(2 (+ 2 3))

(length '((1 2 3)))