#lang scheme

(define (estimate-pi trials)
(sqrt (/ 6 (monte-carlo trials cesaro-test))))

(define (cesaro-test)
  (= (gcd (random 1 100000) (random 1 100000)) 1))

; cesaro-test requires random integers
; If the procedure 'random' was 
; implemented using functional programming,
; it would always return the same number

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1)
                 (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1)
                 trials-passed))))
  (iter trials 0))


