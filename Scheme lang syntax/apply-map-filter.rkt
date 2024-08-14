#lang scheme

(define lst1 '(1 2 3 4 5 6 7))
(define lst2 '(-1 2 3 -4 5 -6 -7))

(apply + lst1)
(apply (car (list + 1 2)) lst2)

(map (lambda (x) (+ x 1)) lst1)
(map (lambda (x) (if (> x 0) #t #f)) lst2)

 
(filter (lambda (x) (if (> x 0) #t #f)) lst2)
(filter (lambda (x) (= 1 (remainder x 2))) lst1)

"Combining Higher Orders"
(apply + (filter (lambda (x) (if (> x 0) #t #f)) lst2))
(map (lambda (x) (* x x)) (filter (lambda (x) (= 1 (remainder x 2))) lst1))

"-------- My map-filter-apply---------"
"apply"
(define my-apply
  (lambda (proc lst)
    (cond
      ((= (length lst) 1) (car lst))
      ((> (length lst) 1) (proc (car lst) (my-apply proc (cdr lst)))))))
"map"
(define my-map
  (lambda (proc lst)
    (if (null? lst)
        '()
        (cons (proc (car lst)) (my-map proc (cdr lst))))))
"Filter"
(define my-filter
  (lambda (proc lst)
    (if (null? lst)
        '()
        (if (proc (car lst))
            (cons (car lst) (my-filter proc (cdr lst)))
            (my-filter proc (cdr lst))))))

(my-apply + lst1)
(my-apply (car (list + 1 2)) lst2)


(my-map (lambda (x) (+ x 1)) lst1)
(my-map (lambda (x) (if (> x 0) #t #f)) lst2)

(my-filter (lambda (x) (if (> x 0) #t #f)) lst2)
(my-filter (lambda (x) (= 1 (remainder x 2))) lst1)