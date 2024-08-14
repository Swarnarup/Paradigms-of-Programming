#lang scheme

; Notice the absence of libraries
; to implement mutable lists

(define (mcons x y)
 (define (change-x! v) (set! x v))
 (define (change-y! v) (set! y v))
  ; Message-passing technique
  ; dispatch does a case analysis, either to do some action on its own or
  ; forward the request to the appropriate internal/external procedure
  (define (dispatch m)
    (cond ((eq? m 'mcar) x)
          ((eq? m 'mcdr) y)
          ((eq? m 'set-mcar!) change-x!)
          ((eq? m 'set-mcdr!) change-y!)
          ;((eq? m 'mdisplay) mdisplay)
          (else
           (error "Undefined operation: CONS" m))))
dispatch)


; defining each of the procedures one
; intends to allow the object to make use of

(define (mcar z) (z 'mcar))
(define (mcdr z) (z 'mcdr))

(define (set-mcar! z new-value)
  ((z 'set-mcar!) new-value) z)
(define (set-mcdr! z new-value)
  ((z 'set-mcdr!) new-value) z)

(define (mdisplay z)
  (begin
   (display "{") (display (mcar z)) (display " ")
   (display (mcdr z)) (display "}"))
  (void)
)
; mdisplay is expected to return some object.
; (void) allows us to specify that the
; procedure returns nothing.



;; Test cases

; defining a mutable pair
(define my-pair (mcons 1 2))

; Displaying the pair as a mutable list
(display "The mutable pair is ")
(mdisplay my-pair)
(newline)


; Displaying the car and cdr of pair
(display "Its first and second elements are\n")
(mcar my-pair)
(mcdr my-pair)


; Changing the first element of the pair
(set-mcar! my-pair 5)
(display "After changing the first element with 5, the mutable pair is ")
(mdisplay my-pair)
(newline)

; Changing the second element of the pair
(set-mcdr! my-pair 6)
(display "After changing the second element with 6, the mutable pair is ")
(mdisplay my-pair)
