#lang scheme

(symbol? "hello")
(symbol? 'hello)

(string? "hello")
(string? 'hello)

(symbol->string 'hello)
(string->symbol "hello")

(symbol? 2)
(symbol? '2)
(symbol? '2nh)

(+ 2 '3)
;(+2 'three) error

" -----Numbers--------- "

(integer? 3)
(integer? 3.0)
(integer? 3.1)
(integer? (/ 9 3))
(integer? (- 4+7i 9+7i))
(integer? (- 4+7i 9+5i))

" -----------Reals------------- "
(real? 3)
(real? 3.0)
(real? 3.1)
(real? (/ 9 3))
(real? (- 4+7i 9+7i))
(real? (- 4+7i 9+5i))


" ------------Math--------- "
(- -2-4i)
(- 10 1 1 1)
(/ 64 2 2 2 2)

(sqrt -1)
(sqrt +i)

(/ 17 3)
(/ 17 3.0)
(/ 17.0 3)
(quotient 17 3)
(remainder 17 3)


" -------------Define----------------"
(define a 1)
(define b 2)
(define (c) 3)
(define (d) b)

a
b
c
(c)
d
(d)


" --------------- Equality-------------"

(define num 5)
(= 5 (+ 2 3))
(= num (+ 2 3))
(= num 5)
(= 6 '6)
;(= "world" "world") contract violation  expected: number?  given: "world"

"--eq?--"
(eq? 6 '6)
(eq? num (+ 2 3))
(eq? num 5)
(eq? "hello" "hello")   ;-------> True
(eq? 'hello 'hello)
(eq? "hello" 'hello)
(eq? (symbol->string 'hello) (symbol->string 'hello))
(eq? (string->symbol "hello") (string->symbol "hello"))
(eq? '(1 2 3) '(1 2 3))
(eq? (list 1 2) (list 1 2))

"-equal-?"
(equal? 6 '6)
(equal? num (+ 2 3))
(equal? num 5)
(equal? "hello" "hello")
(equal? 'hello 'hello)
(equal? "hello" 'hello)    ;----->False
(equal? (symbol->string 'hello) (symbol->string 'hello))
(equal? (string->symbol "hello") (string->symbol "hello"))
(equal? '(1 2 3) '(1 2 3))
(equal? (list 1 2) (list 1 2))




"------------------ Miscelleneous-----------------"
(define l1 (list 1 2 3))
(define l2 (list 1 2 3))
(define emptyL (list))

;(= l1 l2)  error

(eq? l1 l2)
(equal? l1 l2)

(newline)

(eq? '(1 2 3) '(1 2 3))
(equal? '(1 2 3) '(1 2 3))
(newline)

(eq? emptyL '())
(equal? emptyL '())
