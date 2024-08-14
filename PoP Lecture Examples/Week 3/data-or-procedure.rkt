#lang scheme

(define (cons a b)
        (lambda (choice)
           (cond((= choice 1) a)
                ((= choice 2) b)))
)  


(define (car x) (x 1))
(define (cdr x) (x 2))

(display "(cons 5 4) is a ") (display (cons 5 4))

(define x (cons 5 4))
(newline)
(display "x is ") (display x)
(newline)
(display "car of x is ") (display (car x))
(newline)
(display "cdr of x is ") (display (cdr x))

;cons seems to be storing data although it is just a procedure.