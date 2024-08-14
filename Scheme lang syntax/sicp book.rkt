#lang scheme



(define (sum-odd-squares tree)
  (cond ((null? tree) 0)
        ((not (pair? tree))
         (if (odd? tree) (* tree tree) 0))
        (else (+ (sum-odd-squares (car tree))
                 (sum-odd-squares (cdr tree))))))

(define aa 90)

(define rev
  (lambda (x)
    (if (null? x)
        '()
        (append (rev (cdr x)) (list (car x))))))










