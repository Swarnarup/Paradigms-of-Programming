#lang scheme
(require racket/stream)


(define (stream-car stream) (stream-first stream))
(define (stream-cdr stream) (force (stream-rest stream)))

(define (stream-null? a)(null? a))
(define the-empty-stream '())


(define (stream-ref s n)
(if (= n 0)
(stream-car s)
(stream-ref (stream-cdr s) (- n 1))))


(define (stream-map proc s)
(if (stream-null? s)
the-empty-stream
(stream-cons (proc (stream-car s))
(stream-map proc (stream-cdr s)))))


(define (stream-for-each proc s)
(if (stream-null? s)
'done
(begin (proc (stream-car s))
(stream-for-each proc (stream-cdr s)))))


(define (integers-starting-from n)
(stream-cons n (integers-starting-from (+ n 1))))





(define (divisible? a b)
  (= 0 (remainder a b)))


(define (sieve stream)
(stream-cons
(stream-car stream)
(sieve (stream-filter
(lambda (x)
(not (divisible? x (stream-car stream))))
(stream-cdr stream)))))
(define primes (sieve (integers-starting-from 2)))



(define (applyn s cnt)
    (if (= cnt 1)
        s
        (applyn (stream-cdr s) (- cnt 1))))













(define (insert cmp L1 n)
  (cond
    ((null? n) (list L1))
    ((null? L1) (mcons n L1))
    ((cmp n (mcar L1)) (set-mcar! L1 n))
    (else (cons (car L1) (insert cmp (cdr L1) n)))
   )
)

(define (insertionSort L1 cmp)
  (cond
    ((null? L1) L1)
    (else (insert cmp (insertionSort (cdr L1) cmp) (car L1)))))


(define ll (mcons 5(mcons 3 (mcons 1 (mcons 8(mcons 9 '()))))))

;(insertionSort ll <)



"
(define (fix-swap ptr cmp)
  (let ((a (mcar (mcdr ptr)))
        (b (mcar (mcdr (mcdr ptr)))))
    (if (cmp a b)
        (begin
          (
"


(define (fix-swap ptr cmp)
  (cond ((and (mpair? ptr) (mpair? (mcdr ptr)))      
         (let ((a (mcar ptr))
               (b (mcar (mcdr ptr))))
           (cond ((cmp b a)
                  (begin
                    (set-mcar! ptr b)
                    (set-mcar! (mcdr ptr) a)
                    (fix-swap (mcdr ptr) cmp))))))))


(define (isort l cmp)
  (if(null? (mcdr l))
     (fix-swap l  cmp)
     (begin
       (isort (mcdr l) cmp)
       (fix-swap l cmp))))
       

(define (seap m)
  (let((a (mcar m))
       (b (mcdr m)))
    (set-mcar! m b)
    (set-mcdr! m a)))

(define mm (mcons 3 5))

(seap mm)


"--------------"


(define s (stream-cons 1 s))






