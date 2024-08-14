#lang scheme


(define aa (mcons 3 4))

(define bb (mcons (mcar aa) 5))
aa
bb
(set! aa 7)
aa
bb

(define mix (cons 5(cons 4 (mcons 1 (mcons 2 '())))))

mix

(define (mlist . x)
  (let((lst x))
    (define (helper l)
      (if(null? l)'()
         (mcons (car l)(helper (cdr l)))))
    (helper lst)))
"---------------------"
(define a (mcons 'a 'b))
(define b (cons a a))
(define c (cons a b))

a
b
c
(eq? (car b)(cdr b))

(set-mcar! a 'wow)

a
b
c

(define kk (cons (cons 1 2)(cons 1 2)))
(eq? (car kk)(cdr kk))


"--------------"

(define (my-con x y)
  (define (set-x val)(set! x val))
  (define (set-y val)(set! y val))
  (define (dispatch m)
    (cond((eq? m 'my-x) x)
         ((eq? m 'my-y) y)
         ((eq? m 'set-x)set-x)
         ((eq? m 'set-y)set-y)))
  dispatch)

(define (my-x cn)(cn 'my-x))
(define (my-y cn)(cn 'my-y))
(define (set-x cn val)((cn 'set-x) val))
(define (set-y cn val)((cn 'set-y)val))
(define (my-display cn)
  (begin
    (display "{")(display (my-x cn))(display " . ")(display (my-y cn))(display "}"))
    (newline))


(define my-c (my-con 1 2))
(my-display my-c)
(set-x my-c 11)
(my-display my-c)


"-------------------------"

(define x 0)
(define (id n)
  (set! x n)n)

x
(define y (+ (id 5)6))

x
y
x


"--------------------"

(define xx 1)
(set! xx 10)
(define (g y)(+ y xx))
(define (f xx)(g 2))
(f 7)


"---------------"


(define (try a b)(if(> a 0)a b))


(define (cp pr cnt)
  (cond((null? pr)0)
     ((not (pair? pr)) 1)
     (else(+ (cp (car pr) cnt)(cp (cdr pr) cnt)))))

(define prr (cons 1 2))
(define prrr (cons (cons prr prr)(cons prr prr)))

(cp prrr 0)

(define (px c p)(+ c p))
(define apple 5)


(define (p)(p))
(define (test x y)
  (if(= x 0) 0 y))


