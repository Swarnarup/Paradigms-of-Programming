#lang scheme

(define foo-counter
                (let ((count 1))
                   (lambda ()
                     (set! count (+ count 1))
                       count)))


(define loo-counter
               (lambda ()
                  (let((count 1))
                      (set! count (+ count 1))
                         count)))

(define boo-counter
                (let ((count 0))
                   (lambda ()
                     (set! count (+ count 1))
                      count
                       (set! count 0))))



(foo-counter)
(loo-counter)
(boo-counter)

(foo-counter)
(loo-counter)
(boo-counter)