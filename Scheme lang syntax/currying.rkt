#lang scheme

(define secret-num
  (lambda (secret guess)
    (= secret guess)))

(define secret-num-guess
  (lambda (num)
    (lambda (guess)
      (secret-num num guess))))

(define guessing-game (secret-num-guess 10))

guessing-game

(guessing-game 5)
(guessing-game 10)


" Currying in Higher Order functions..."

(define lst (list 1 2 3 4 5 6 7 8 9))

(define in-range
  (lambda (min max)
    (lambda (x)
      (and (>= x min) (<= x max)))))

(filter (in-range 4 8) lst)

(define inc
  (lambda (n)
    (lambda (x)
      (+ x n))))

(map (inc 3) lst)



"Ploynomial calculation"
(define poly
  (lambda (a b c)
    (lambda (x)
      (+ (* a (* x x x)) (* b (* x x)) (* c x)))))

(define poly-1-2-3 (poly 1 2 3))

