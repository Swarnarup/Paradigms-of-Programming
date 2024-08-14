#lang scheme


(define (binary-gcd a b)
  (if (= a b)
      a
      (let loop ((a (abs a)) (b (abs b)) (shift 0))
        (cond
          ((= a 0) b)
          ((= b 0) a)
          ((even? a) (if (even? b)
                        (loop (quotient a 2) (quotient b 2) (+ shift 1))
                        (loop (quotient a 2) b shift)))
          ((even? b) (loop a (quotient b 2) shift))
          (else (if (> a b)
                    (loop (- a b) b shift)
                    (loop a (- b a) shift)))))))

; Example usage:
(display (binary-gcd 24 36)) ; Output: 12
(newline)


(define as
  (lambda (a b)
    (+ a b)))





(define (flatten-list lst)
  (cond
    ((null? lst) '()) ; Base case: empty list returns empty list
    ((not (pair? lst)) (list lst)) ; Base case: if lst is not a pair, return a list containing lst
    (else (append (flatten-list (car lst)) (flatten-list (cdr lst)))))) ; Recursive case: flatten car and cdr and append them

; Example usage:
(display (flatten-list '(4 6 8 (a 11 (12 camel)) 14))) ; Output: (4 6 8 a 11 12 camel 14)
(newline)


(define ls '(1 2 3))



(define ft
  (lambda (lst)
    (if (null? lst)
        '()
        (if (list? (car lst))
            (append (ft (car lst)) (ft (cdr lst)))
            (cons (car lst) (ft (cdr lst)))))))



(define do-while
  (lambda (proc start limit inc)
  ;  (display proc)
 ;   (display "--")
;    (display start)
    (proc start)
;    (newline)
    (let ((new_start (inc start)))
    (if (> new_start limit)
        (newline)
        (do-while proc new_start limit inc)))))


(define (add x) (+ 1 x))
(do-while (lambda (x) (newline) (display x)) 1 10 add)



(define (do-while1 proc start limit inc)
  (let loop ((current start))
    (display (proc current)) ; Execute the procedure with the current value
    (when (<= current limit)
      (loop (inc current)))))

;(do-while (lambda (x) (display x) (newline)) 1 5 add)







"............. Assignment 2 .................. "

(define repeated
  (lambda (proc n)
    (if (= n 1)
        proc
        (lambda (x) (proc ((repeated proc (- n 1)) x))))))


(define (square x) (* x x))

((repeated square 3) 2)



(define list-reducer2
  (lambda (ll)
  (if (null? ll)
      '()
      (if (= 2 (length (car ll)))
          (cons (car ll) (list-reducer (cdr ll)))
          (append '() (list-reducer (cdr ll)))))))

(define list-reducer
  (lambda (ll)
    (cond ((null? ll) '())
          ((not (pair? (car ll))) (append '() (list-reducer (cdr ll))))
          ((= 2 (length (car ll))) (cons (car ll) (list-reducer (cdr ll))))
          (else (append '() (list-reducer (cdr ll)))))))

(list-reducer  (list '(3 4) '(5 (6 8 7) 9) '(9 11)))
(list-reducer '((1 2 3) 4 5 (2 3) 6))



(define anti-cdr
  (lambda (lis)
    (cond ((null? lis) '())
          ((null? (cdr lis)) '())
          (else (cons (car lis) (anti-cdr (cdr lis)))))))

(anti-cdr  (list '(3 4) '(5 (6 8 7)) (list 9 11)))


(define (my-cons a b)
  (define (dispatch op)
    (cond ((eq? op 'my-car) a)
          ((eq? op 'my-cdr) b)
          ((eq? op 'value) (* (expt 2 (+ a 1)) (expt 3 (+ b a))))
          (else (error "unexpected" op))))
  dispatch)





" --------flatten----------- "

(define (flatten seq)
  (if (not (list? seq))
      (list seq)
      (apply append (map flatten seq))))

(flatten '((1 2) 3 ((4)(5)) 6))
(apply append '((1 2)(3 4)(5 (8 9) 6)))

" ---------power set-----------"

(define powerset
  (lambda (set)
    (if (null? set)
        '(())
        (append (powerset (cdr set))
                (map (lambda (subset) (cons (car set) subset)) (powerset (cdr set)))))))

(powerset '(1 2 3))

(define x 10)
(let* ((a x)
      (b a))
  (+ a b))

"-------------------"

(cons '(1 2) '(1 2))
((lambda (x) (cons x x)) '(1 2))

"------------"
;(define umap
 ; (lambda (fn seq)
  ;  (if (null? seq)
   ;     '()
    ;    (cons (fn (car seq)) (umap fn (cdr seq))))))
(map + '(1 2) '(1 2))
(map * '(1) '(2))

(define bar
  (lambda (a b . c)
    (list a b c)))

(bar 1 2 3 4 5 6)
(bar 1 2)

(define str '((lambda (x) (* x x)) 10))




"-------------"

(define (counter)
  (define v 0)
  (lambda () (begin
              (set! v (+ v 2))
              v)))

(cond ((> 2 3)(+ 2 3))
      ((> 3 4)(+ 3 4))
      (#t(+ 4 5)))

"--------------"

(define (counter2 x)
  (define helper
    (lambda ()
      (begin
        (display x)
        (newline)
        (set! x (+ x 1)))))
  helper)

(define k (counter2 2))
(define kk (counter2 3))
(k)
k
k
(k)
(k)

"similarly"

(define counter3
  (let ((cnt 0))
    (lambda ()
    (set! cnt (+ 1 cnt))
      cnt)))
    
(counter3)
(counter3)
(counter3)


" -----------dotted tail notation --------"

(define (sum . a)
    (define (helper s lst)
      (if (null? lst)
          s
          (helper (+ s (car lst)) (cdr lst))))
    (helper 0 a))
"==========="
(define lst1 (list 1 2 3))
(define lst2 (list 1 2 3))

(list lst1 lst2)
(append lst1 lst2)
(cons lst1 lst2)

"--------------"

(define lllst '(a list \(\(\(\b\)\ \)))
lllst
(display lllst)

"================="

(define a 10)
(define b a)
a
b
(set! a 5)
a
b
(define ll (cons 10 15))
ll
(set! ll 15)
ll

(define (test op cnt)
  (define (helper)
  (let ((num 0))
    (if (= 1 (gcd (random 1 10000000) (random 1 10000000))) 1 0)))
  (if (<= cnt 0)
      op
      (test (+ op (helper))(- cnt 1))))

(define countt 100000)
(define nnn (test 0 countt))
(sqrt (/ 6 (/ nnn countt)))

"================="

(define f1
  (let ((init 2))
    (lambda (x)
      (set! init (+ x init))
      init)))

(define f2
    (lambda (x)             ;Not same a sprevious one // Here it's not acting like a counter every time building a new init = 2
      (let ((init 2))
      (set! init (+ x init))
      init)))

"================="

(define newVar 10)
(define cntr
  (lambda ()
    (set! newVar (+ 1 newVar))
    newVar))

(cntr)
(cntr)
(cntr)
newVar


"====================="

(define ccntr
  (let ((init 0))
    (lambda ()
      (set! init (+ 1 init))
      init)))

(define (ccntr0)
  (let ((init 0))
    (lambda ()
      (set! init (+ 1 init))
      init)))


"=============="
(define bc 100)
(define (make-bc)
  ;(define bc 200)
  (lambda()
    (set! bc (+ bc 1))
    bc))


"====================="

(define newpair (mcons 10 20))

(define xx 10)
(define pp (mcons xx xx))

(define xxx (mcons 10 10))
(define ppp (mcons xxx xxx))

pp
(set! xx 100)
pp
ppp
(set-mcar! xxx 100)
ppp

" CIRCLAR LIST "
(define (last-elem lst)
  (if (null? (mcdr lst))
      lst
      (last-elem (mcdr lst))))

(define make-circular
  (lambda (x)
         (set-mcdr! (last-elem x) x)
         x))

(define my-list (mcons 1 (mcons 2 (mcons 3 null))))
my-list
(define circular-list (make-circular my-list))
circular-list
(mcar circular-list)
(mcar (mcdr circular-list))
(mcar (mcdr (mcdr circular-list)))
(mcar (mcdr (mcdr (mcdr circular-list))))


"    "

(define (plus . x)
  (define (sumit x sum)
    (if (null? x)
        sum
        (sumit (cdr x) (+ sum (car x)))))
  (sumit x 0))

(define plus2
  (lambda x
  (define (sumit x sum)
    (if (null? x)
        sum
        (sumit (cdr x) (+ sum (car x)))))
  (sumit x 0)))

(plus 1 2 3)

"==================="

(define mylist
  (lambda x
    (if (null? x)
        '()
        (cons (car x) (cdr x)))))



"------------------"

