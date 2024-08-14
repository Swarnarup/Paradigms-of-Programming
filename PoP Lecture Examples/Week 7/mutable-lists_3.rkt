#lang scheme

; Libraries to implement mutable lists
(require compatibility/mlist)
(require rnrs/mutable-pairs-6)


(define mutable-list1 (mlist 1 2))
(define mutable-list2 (mlist 3 4))


(display "The three procedures mcons, mlist and mappend\n     are analogous to cons, list and  append\n\n")
(display "mutable-list1 and mutable-list2\n")
mutable-list1
mutable-list2

(display "Their mcons is\n")
(mcons mutable-list1 mutable-list2)
(display "Their mlist is\n")
(mlist mutable-list1 mutable-list2)
(display "Their mappend is\n")
(mappend mutable-list1 mutable-list2)

