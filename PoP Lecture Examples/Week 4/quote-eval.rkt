#lang scheme

(car '(a b c))

(define exp1 (list 'car (list 'quote '(a b c))))
exp1
(eval exp1  (make-base-namespace))


(define exp2 (list (quote car) (list (quote quote) (quote (a b c)))))
(eval exp2  (make-base-namespace))
