#lang scheme

(define a 6)
(define b a)
(display "Values of a and b before using set!\n")
a b

#|
After defining b to a, 
1> b becomes an alias for a? aka a and b refer to the same instance of 6.
2> b and a refer to two different instances of 6. 
|#

#|
set! is the cause of all these concerns. Without set such questions do not make sense.
If set! is not part of the language, either of the cases could be true and we would not be facing any ambiguity.
Without set! a's value would never change and thus both a and b would always be referring to 6.
|#

(set! a 10)
(display "Values of a and b after using set!\n")
a b

(display "set! is the cause of all these concerns.")

#|
After set! a to 10, should
1> b refer to 6 and a now refer to 10 instead of referring to the same 6 which b is referring to. 
2> b refer to 6 and a now refers to 10 instead of referring to 6 and this 6 is different from the 6 which b is .
3> a and b both have value 10 (aka in line with option 1 above)
|#

