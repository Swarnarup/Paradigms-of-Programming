#lang scheme

; Libraries to implement mutable lists
(require compatibility/mlist)
(require rnrs/mutable-pairs-6)


(define mutable-list1 (mlist 1 2))
(define mutable-list2 (mlist 3 4))
(display "mutable-list1 is \n")
mutable-list1

; changing the car part of a mutable list

(set-mcar! mutable-list1 5)
(display "Updating the head\n")
mutable-list1

; changing the cdr part of a mutable list

(set-mcdr! mutable-list1 (mlist 11 12))
(display "Updating the tail\n")
mutable-list1

(newline)
(newline)

(display "one can use cons and mcons to construct  different types of lists\n\n")
(display "-->(mcons 4 mutable-list1) creates a new 'mlist' with 4 added \n before the first element in mutable-list1\n")
(define list-inside-mlist (mcons 4 mutable-list1))
list-inside-mlist

(display "-->(cons 4 mutable-list1) creates a new 'list' with two items\n")
(define mlist-inside-list (cons 4 mutable-list1))
mlist-inside-list

(display "One can modify the mutable list inside a list\n")
(set-mcar! (cdr mlist-inside-list) (mlist  'a 'b))
mlist-inside-list

; Any part of the mutable list can be changed,
; However, only a mutable part(if it exists) of an immutable list (Functional) can be changed