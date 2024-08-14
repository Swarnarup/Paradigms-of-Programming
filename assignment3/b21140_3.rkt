#lang scheme
(require racket/stream)


"supplimentary Functions"
(define mut-list
  (lambda x
    (define (mk x)
      (if (null? x)
          x
          (mcons (car x) (mk (cdr x)))))
    (mk x)))


(define (applynth s cnt)
    (if (= cnt 1)
        (stream-car s)
        (applynth (stream-cdr s) (- cnt 1))))







"--------------------------------------"
"Q1"





"Procedure make-cb"
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



"Procedure write-buff (enq function)"
(define (write-cb buff-name x)
  (define (end-ptr buff-name) (mcdr buff-name))
  
  (set-mcar! (end-ptr buff-name) x)
  (set-mcdr! buff-name (mcdr (end-ptr buff-name))))


"Procedure read-buff (deq functon)"
(define (read-cb buff-name)
  (define (front-ptr buff-name) (mcar buff-name))
  (define (front buff-name) (mcar (front-ptr buff-name)))
  
  (display (front buff-name))
  (newline)
  (set-mcar! buff-name (mcdr (front-ptr buff-name))))


;(define cb1 (make-cb 3))
;(write-cb cb1 88) (write-cb cb1 77) (read-cb cb1) (write-cb cb1 66) (write-cb cb1 55) (write-cb cb1 44) (read-cb cb1) (read-cb cb1) (read-cb cb1) (read-cb cb1)











"----------------------------------------------------"
"Q2"


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
       (fix-swap l cmp)
       l)))




;(define ll (mcons 5(mcons 3 (mcons 1 (mcons 8(mcons 9 '()))))))
;"mutable list : ll "ll
;(isort ll <)
;"sorted list: "ll











"---------------------------------------------"
"Q3"




(define (stream-car stream) (stream-first stream))
(define (stream-cdr stream) (force (stream-rest stream)))



(define (harmonic a d)
  (define (helper a d n sm)
        (stream-cons (+ sm (/ 1 (+ a (* d (- n 1)))))
              (helper a d (+ n 1) (+ sm (/ 1 (+ a (* d (- n 1))))))))
  (helper a d 1 0))


"Harmonic sum stream with values a=1 and d=1"
(define harmoni (harmonic 1 1))
;harmoni
;(stream-car harmoni) (stream-car (stream-cdr harmoni)) (stream-car (stream-cdr (stream-cdr harmoni)))











"----------------------------------------------------------"
"Q4"


(define (integers-starting-from n)
  (stream-cons n (integers-starting-from (+ n 1))))

(define (divisible? a b)
  (= 0 (remainder a b)))

(define (sieve stream)
  (stream-cons
   (stream-car stream)
   (sieve (stream-filter
           (lambda (x)(not (divisible? x (stream-car stream)))) (stream-cdr stream)))))

(define (helper stream sm)
  (stream-cons (remainder (+ sm (stream-car stream)) 10007) (helper (stream-cdr stream) (+ sm (stream-car stream)))))




"prime-mod stream"
(define prime-mod
  (helper (sieve (integers-starting-from 2)) 0))

;prime-mod
;(stream-car prime-mod) (applynth prime-mod 1) (applynth prime-mod 2) (applynth prime-mod 4)











