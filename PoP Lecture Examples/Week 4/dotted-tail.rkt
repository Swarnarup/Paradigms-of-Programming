#lang scheme

; This procedure performs summation of a sequence of numbers
; which could possibly be empty

(define (plus . x)
  (define (iterator x sum)
    (if(equal? x '())
     sum
     (iterator (cdr x) (+ sum (car x)))
  )
  )
  (iterator x 0)
)

; This procedure multiplies two or more numbers
; If the procedure has less than two operands, it should throw an error.

(define (multiply x y . z)
(define (iterative-multiplier x prod)
    (if(equal? x '())
       prod
       (iterative-multiplier (cdr x) (* prod (car x)))
  )
      )
  (iterative-multiplier z (* x y))
)

; Test cases

(display "These examples showcases the utility of dotted-tail notation \n\n")
(display "(plus 4 2 1) is " ) (plus 4 2 1)
(display "(plus 4) is " )(plus 4)
(display "(plus) is " )(plus)

(newline)


(display "(multiply 3 4 5) evaluates to " ) (multiply 3 4 5)
(display "(multiply 3 6) evaluates to " ) (multiply 3 6)
(display "(multiply 3) evaluates to " )(multiply 3)