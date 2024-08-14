#lang scheme

(require racket/stream)

(define (setlast! l x)
  (if (null? (mcdr l))
      (set-mcdr! l x)
      (setlast! (mcdr l) x)))

(define ll (mcons 1 (mcons 2 (mcons 3 (mcons 4 (mcons 5 '()))))))

(define (makelist n)
  (if (= n 0)
      '()
      (mcons 0 (makelist (- n 1)))))


(setlast! ll ll)

(define cb (mcons ll ll))

(define (front-ptr ptrs) (mcar ptrs))
(define (end-ptr ptrs) (mcdr ptrs))

(define (front ptrs) (mcar (front-ptr ptrs)))
(define (end ptrs) (mcar (end-ptr ptrs)))

(define (write-cb buff-name x)
  (define (front-ptr buff-name) (mcar buff-name))
  (define (end-ptr buff-name) (mcdr buff-name))

  (define (front buff-name) (mcar (front-ptr buff-name)))
  (define (end buff-name) (mcar (end-ptr buff-name)))
  
  (set-mcar! (end-ptr buff-name) x)
  (set-mcdr! buff-name (mcdr (end-ptr buff-name))))

(define (read-cb buff-name)

  (define (front-ptr buff-name) (mcar buff-name))
  (define (end-ptr buff-name) (mcdr buff-name))

  (define (front buff-name) (mcar (front-ptr buff-name)))
  (define (end buff-name) (mcar (end-ptr buff-name)))
  
  (display (front buff-name))
  (newline)
  (set-mcar! buff-name (mcdr (front-ptr buff-name))))




(define (make-cb n)
  (define (makelist n)
    (if (= n 0)
        '()
        (mcons 0 (makelist (- n 1)))))
  (define (setlast! l x)
    (if (null? (mcdr l))
        (set-mcdr! l x)
        (setlast! (mcdr l) x)))

  (define qq (makelist n))
  (setlast! qq qq)

  (define cb (mcons qq qq))

  cb)

"----------------------------"

;(define (force a) (a))

;(define (delay obj) (lambda() obj))

;(define (stream-cons a b) (cons a (delay b)))

(define (stream-car stream) (car stream))
(define (stream-cdr stream) (force (cdr stream)))


(define (stream-map proc s)
  (if (null? s)
  '()
  (stream-cons (proc (stream-car s))
               (stream-map proc (stream-cdr s)))))

(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))


(define (add-streams s1 s2) (stream-map + s1 s2))

(define (stream-filter pred stream)
(cond ((null? stream) '())
      ((pred (stream-car stream))
       (cons (stream-car stream)
             (delay (stream-filter pred (stream-cdr stream)))))
      (else (stream-filter pred (stream-cdr stream)))))


(define (integers-starting-from n)
(cons n (delay (integers-starting-from (+ n 1)))))






;(define (harmonic a d n) (cons (/ 1 (+ a (* d (- n 1)))) (delay (harmonic a d (+ n 1)))))



;(define (harmon a d)
 ; (define (helper a d n) (cons (* (/ 1 d)(log (/ (+ (* 2 a)(* d (- (* 2 n) 1))) (- (* 2 a) d)))) (delay (helper a d (+ n 1)))))
  ;(helper a d 1))

;(define (harmonic a d)
 ; (define (helper a d n sm)
  ;      (cons (+ sm (/ 1 (+ a (* d (- n 1)))))
   ;           (delay (helper a d (+ n 1) (+ sm (/ 1 (+ a (* d (- n 1)))))))))
  ;(helper a d 1 0))



(define (applyn s cnt)
    (if (= cnt 0)
        (stream-cdr s)
        (applyn (stream-cdr s) (- cnt 1))))




(define (stcn a b)
  (lambda() (cons a (delay b))))

(define (fib a b) (cons a (delay (fib b (+ a b)))))

(define (fibgen a b) (stcn a (fibgen b (+ a b))))








(define ones (stream-cons 1 ones))


























