#lang scheme

;How to capture non-numeral/string data type


;string-char and string1 are exactly the same.

(define string-char  (string #\C #\h #\a #\o #\s #\ #\i #\s #\ #\f #\a #\i #\r ))
(define string1 "Chaos is fair")

(display "string-char is ") string-char
(display "string1 is ")string1
(newline)


; String2 is trying to store a double-quote and back-slash as a part of the string by using
; single back-slash as an escape character preceding these symbols.

(define string2 "Chaos is \"fair\\ ")

(display "string2 is ")string2
(newline)
(display "string2 is displayed as --> ") (display string2)