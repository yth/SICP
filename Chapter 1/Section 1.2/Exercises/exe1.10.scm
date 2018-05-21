; Ackermann function is the simplest example of a well-defined total function
; that is not primitive recursive.

; A primitive recursive function is a function that can be implmented requiring
; only do loops (a special case of while loops), as opposed to a combination of
; while and for loops.

(define (A x y)
    (cond
        ((= y 0) 0) 
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))
    )
)

(define (f n) (A 0 n)) ; f(n) = 2n

(define (g n) (A 1 n)) ; g(n) = 2^n

(define (h n) (A 2 n)) ; h(n) = 2^(2^(2^(2^(2.....))))) where tower height is n

(define (assert-eq exp result)
    (if (eq? exp result)
        (display "True")
        (display "False")
    )
)

(assert-eq
(A 1 10)
1024
)

(assert-eq
(A 2 4)
65536
)

(assert-eq
(A 3 3)
(A 2 4)
)