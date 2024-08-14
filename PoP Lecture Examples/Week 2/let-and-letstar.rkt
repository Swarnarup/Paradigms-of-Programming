#lang scheme


; Difference between let and let*

(define example-let
  (let ((x 2))
    (let ((x 3) (y x))
     (* x y))
  )
)

(define example-letstar  
   (let ((x 2))
        (let* ((x 3) (y x))
         (* x y))
   )
)

(define example-letstar2  
   (let ((x 2))
        (let* ((y x) (x 3))
         (* x y))
   )
)

; The difference between example-letstar and example-letstar2 is the ordering. The order affects the output.
; In case of let-star , y is using the value of x defined inside  let*
; In case of let-star2, y is using the value of x defined outside let*



#| This version of let throws error as y is unable to access the value of an x set outside the let.

(define example-letstar3  
   (let ((z 2))
        (let ((x 3) (y x))
         (* x y))
   )
)
|#

; Implementing let* without let using nested let

(define example-letstar-using-let  
   (let ((x 2))
        (let ((y x))
         (* x y))
   )
)

(define example-letstar-withoutusing-let  
   (let* ((x 2) (y x))
         (* x y))
)