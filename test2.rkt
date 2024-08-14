#lang scheme


(define (setlast! l x)
  (if (null? (mcdr l))
      (set-mcdr! l x)
      (setlast! (mcdr l) x)))

(define ll (mcons 1 (mcons 2 (mcons 3 (mcons 4 (mcons 5 '()))))))

(setlast! ll ll)

(define cb (mcons ll ll))

(define (front-ptr ptrs) (mcar ptrs))
(define (end-ptr ptrs) (mcdr ptrs))

(define (front ptrs) (mcar (front-ptr ptrs)))
(define (end ptrs) (mcar (end-ptr ptrs)))

(define (write-cb x)
  (set-mcar! (end-ptr cb) x)
  (set-mcdr! cb (mcdr (end-ptr cb))))

(define (read-cb)
  (display (front cb))
  (newline)
  (set-mcar! cb (mcdr (front-ptr cb))))

ll

(write-cb 9)

ll

(write-cb 9)

ll

(write-cb 10)

ll

(write-cb 11)

ll

(write-cb 12)

ll


(write-cb 13)

ll


(write-cb 14)

ll

(read-cb)
(read-cb)
(read-cb)
(read-cb)
(read-cb)
(read-cb)
(read-cb)