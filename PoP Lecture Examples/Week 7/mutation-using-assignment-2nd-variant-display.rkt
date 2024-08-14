#lang scheme

; Notice the absence of libraries
; to implement mutable lists

(define (mcons x y)
 (define (change-x! v) (set! x v))
 (define (change-y! v) (set! y v))
  ; Message-passing technique
  (define (dispatch m)
    (cond ((eq? m 'mcar) x)
          ((eq? m 'mcdr) y)
          ((eq? m 'set-mcar!) change-x!)
          ((eq? m 'set-mcdr!) change-y!)
          ((eq? m 'mdisplay) (begin (display "{")
                                    (display x) ; local x
                                    (display " ")
                                    (display y) ; local y
                                    (display "}")
                                    ))
          (else
           (error "Undefined operation: CONS" m))))
dispatch)


; defining each of the procedures one
; intends to allow the object to make use of

(define (mcar z)     (z 'mcar))
(define (mcdr z)     (z 'mcdr))
(define (mdisplay z) (z 'mdisplay))

(define (set-mcar! z new-value)
  ((z 'set-mcar!) new-value) z)
; Below procedure does not return z aka the dispatch procedure.
(define (set-mcdr! z new-value)
  ((z 'set-mcdr!) new-value))


; mdisplay is expected to return some object
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
(newline)
(display "Notice, that the procedure to change cdr did not return the dispatch procedure")
