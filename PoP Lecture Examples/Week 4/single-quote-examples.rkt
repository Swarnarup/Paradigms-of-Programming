#lang scheme


(define a 2)
(define b 7)

(list a b)
(list 'a b)
'(list a b)
'(list a (()) b)
(newline)

; Escape characters are stored and displayed differently.
; Notice the difference in the colour of the output

(define escape1 '(list a \(b))
(display "escape1 is stored as ")escape1
(display "escape1 is stored as ")(display escape1)
(newline)


;(define escape2 '(list a b\)()(3 4) \(abra\(ca\)dabra))
;(define escape3 '(list a b\)\ \(\)(3 4) \(abra\(ca\)dabra))

(define escape2 '(list a b\)()(3 4)))
(define escape3 '(list a b\)\ \(\)(3 4)))

(display "escape2 is stored as ") escape2
(display "escape3 is stored as ") escape3

(display "escape2 is displayed as ")(display escape2)
(newline)
(display "escape3 is displayed as ")(display escape3)
(newline)

(display (string-append "escape2 has " (number->string (length escape2))  " entities"))
(newline)
(display (string-append "escape3 has " (number->string (length escape3))  " entities"))