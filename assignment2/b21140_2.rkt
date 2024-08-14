#lang scheme

"Q1"

(define repeated
  (lambda (proc n)
    (if (= n 1)
        proc
        (lambda (x) (proc ((repeated proc (- n 1)) x))))))



"Q2"

(define (my-cons a b)
  (define (dispatch op)
    (cond ((eq? op 'mycar) a)
          ((eq? op 'mycdr) b)
          ((eq? op 'value) (* (expt 2 (+ a 1)) (expt 3 (+ b a))))
          (else (error "unexpected" op))))
  dispatch)

(define (my-car proc)
  (proc 'mycar))
(define (my-cdr proc)
  (proc 'mycdr))

;For example;
(define element (my-cons 3 4))
(element 'value)
(my-car element)
(my-cdr element)



"Q3"

(define list-reducer
  (lambda (ll)
    (cond ((null? ll) '())
          ((not (pair? (car ll))) (append '() (list-reducer (cdr ll))))
          ((= 2 (length (car ll))) (cons (car ll) (list-reducer (cdr ll))))
          (else (append '() (list-reducer (cdr ll)))))))




"Q4"

(define anti-cdr
  (lambda (lis)
    (cond ((null? lis) '())
          ((null? (cdr lis)) '())
          (else (cons (car lis) (anti-cdr (cdr lis)))))))