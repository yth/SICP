; fast exp

(define (fast-expt-iter base power extra)
    (cond
        ((= power 0) 1)
        ((= power -1) (* (/ 1 base) extra))
        ((= power 1) (* base extra))
        ((even? power) (fast-expt-iter (square base) (/ power 2) extra))
        (else (fast-expt-iter base (- power 1) (* extra base)))
    )
)

(define (square x) (* x x))

; What we want
(define (fast-expt base power) (fast-expt-iter base power 1))

; Test

(define (assert-eq exp1 exp2)
    (if (= exp1 exp2)
        (display "True")
        (display "False")
    )
)

(assert-eq (fast-expt 1 2) 1)
(assert-eq (fast-expt 2 4) 16)
(assert-eq (fast-expt 2 -4) 1/16)
