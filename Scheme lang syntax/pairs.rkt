#lang scheme

(cons 0 2)
(cons 'a 'b)
'(10 . 20)
(quote (a . b))

(car (cons 'a 'b))
(cdr (cons 'a 'b))
(car '(3 . 4))
(cdr '(3 . 4))

(pair? (cons 1 2))
(pair? (cons 1 '(2)))

(list? (cons 1 2))    ;------->False
(list? (cons 1 '(2)))

(pair? '())       ;----------->False
(list? '())

(newline)

(define pair1 (cons 1 2));----> (1.2)
(define pair2 (cons 1 '()));---->(1.()) -> (1)
(define pair3 (cons 1 (list 2)));->(1.(2)) -> (1 2)
pair1
pair2
pair3
(car pair1)
;(car pair2)
;(car pair3)
(cdr pair1)
;(cdr pair2)
(cdr pair3)


(define cities '((a . (1 . 2)) (b . (2 . 3)) (c . (3 . 4))))
(cons 1 '(2 . 3))
(cons 1 (cons 2 3))
'(1 . (2 . 3))