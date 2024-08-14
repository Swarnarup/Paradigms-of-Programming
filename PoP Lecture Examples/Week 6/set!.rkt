#lang scheme

(define count 0)

(define (demo x)
 (set! count (+ 1 count))
     (+ x count))


(define f  
    (let ((init (/ 1 2)))  
     (lambda (x)  
         (set! init  (- x init)) 
         init)))