#lang scheme

(define x (cons 1 2))
(define y (cons 3 4))
(define z (cons x y))
(define a (cons 5 6))
(define q (cons x 7))


(display "The values of x, y and z are\n")
x y z
(newline)
(display "The head(car) of x is ") (car x)
(display "The tail(cdr) of x is ") (cdr x)
(newline)
(display "The head(car) of z is ") (car z)
(display "The tail(cdr) of z is ") (cdr z)

(display "The (car(car)z) is ")(car (car z))
(display "The (car(cdr)z) is ")(car (cdr z))

(display "(cons a z) is ")(cons a z)
(display "a is inserted into pair z as the first entity ")
(newline)
(display "(cons z a) is ")(cons z a)
(display "z is inserted into pair a as the first entity ")


