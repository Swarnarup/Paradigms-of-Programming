#lang scheme

(let ((count 0))
                   (lambda ()
                      (set! count (+ count 1))
                      count))


; The above anonymous lambda expression creates a count and intializes it to zero.
; However after it is created, we do not have a pointer to this procedure
; and we lose access to the procedure.

(define foo-counter
                (let ((count 1))
                   (lambda ()
                      (display)
                     (display count)
                      (newline)
                     (set! count (+ count 1))
                      count)))

; This procedure which takes no operands has a name my-counter
; Everytime the my-counter is called, the value of count is incremented by 1.
; Since we have a name to access the procedure, we also have access to its bindings
; If we call the procedure my-counter, it will execute in its own "captured" environment
;(created by the let).It will increment the binding of count in that environment,
; and return the result. The environment will continue to exist as long as the procedure does,
; and will store the latest value until next time my-counter is called:
