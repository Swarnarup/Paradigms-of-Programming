#lang scheme


(define a 1000)

(let ((a 2)
      (b 2))
  (+ a b))

" global Scope "
(let ((a 10)
      (b (* 2 a)))
  (+ a b))

" Outer Scope "
(let ((a 10)
      (b 10))
  (let ((a 10)
      (b (* 2 a)))
  (+ a b)))

"---------"
(let ((car cdr)
      (cdr car))
  (list (car '(1 2 3)) (cdr '(1 2 3))))

(define poly
  (lambda (x)
    (let ((a (* 2 x x))
          (b (* 3 x))
          (c 4))
      (+ a b c))))

(poly 10)

(define vol-subtract
  (lambda (height radius diff)
    (let ((pi (/ 22 7)))
      (let ((vol (lambda (h r)
                   (* pi r r h))))
        (- (vol height radius) (vol height (- radius diff)))))))

(vol-subtract 1 1 0.5)

(let ((+ 10)
      (- 4)
      (/ *))
  (/ + -))


".........Let->Lambda and Vice-versa..........."
((lambda (a b) (+ (* a a) (* b b))) 3 4)
(let ((a 3)
      (b 4))
  (+ (* a a) (* b b)))
      