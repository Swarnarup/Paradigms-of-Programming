#lang scheme

; Libraries to implement mutable lists
(require compatibility/mlist)
(require rnrs/mutable-pairs-6)

(define mutable-pair (mcons 3 4))
mutable-pair

;mcar and mcdr for mutable pairs are analogous to
; car and  cdr for immutable pairs (i.e lists).

(for-each display (list "The two parts of the mutable-pair are " (mcar mutable-pair) " and " (mcdr mutable-pair) "\n"))


;(display "The two parts of mutable-pair are "(mcar mutable-pair) " and " (mcdr mutable-pair))

;One can also modify contents of a mutable pair

(set-mcar! mutable-pair 5)
mutable-pair
(set-mcdr! mutable-pair 6)
mutable-pair



(display "lists are delimited by () while\nmutable lists are delimited by {}\n")
(newline)

(define list1 (list 1 2))
(display "list1 is \n")
list1

#|
An attempt to build set-car! procedure,
which changes the first element of a list
does not work as intended
|#

(define (set-car! x list)
  (set! list (cons x (cdr list)))
  (display "Modifying the list using a procedure we get \n")
  list
 )


(set-car! 5 list1)
(display "However, if one checks the content of list1, we get\n")
list1

#|
This does not change list1 because the set-car! procedure
creates a new list with desired contents
without modifying the existing list.
The default list mechanism is not designed to
accommodate change in content
|#