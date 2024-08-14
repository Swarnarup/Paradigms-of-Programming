#lang scheme


; Higher order function reduce/accumalate

(define (reduce proc input-list base)
  (if (null? input-list)
      base
      (proc (car input-list) (reduce proc (cdr input-list) base))))



; Higher order function filter

(define (filter pred? input-list)
  (cond ((null? input-list) '())
        ((pred? (car input-list))
         (cons (car input-list) (filter pred? (cdr input-list))))
         (else (filter pred? (cdr input-list)))
         )
 )


(define (square x) (* x x))
(define (custom-print x)
           (newline)
           (display "Next square is ")
           (display x))
(for-each custom-print (map square (list 3 4 5 6)))