#lang scheme 

; Single quote preceeding a list is syntatic sugar for the "quote" procedure.
; This implies that the expression after the single quote must be a valid list.

(define quote-list1 '(Chaos is fair))
(define quote-list2 (quote (Chaos is fair)))

; The two quoted list entities are same.

(equal? quote-list1 quote-list2)

; In order to use open/close brackets inside a quote,
; we need to use back-slash as an escape character
(define quote-list3 (quote (Chaos is \(fair\)\)abc)))

(display "quote-list3 is stored as ") quote-list3

(display "quote-list3 is displayed as ")(display quote-list3)
(newline)

