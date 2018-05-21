; Using 1 as the first number

(define (pascal row col)
    (if (and (> row 0) (> col 0))
        (cond
            ((and (= row 1) (= col 1)) 1)
            ((or (= col 1) (= col row)) 1)
            (else (+ (pascal (- row 1) (- col 1)) (pascal (- row 1) col)))
        )
        (display "Error: Cannot use a negative number as an argument")
    )
)

(define (assert-eq exp result)
    (if (eq? exp result)
        (display "True")
        (display "False")
    )
)

(assert-eq (pascal 1 1) 1)

(assert-eq (pascal 2 2) 1)

(assert-eq (pascal 5 3) 6)
