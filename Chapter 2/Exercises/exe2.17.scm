; Exercise 2.17

(define (last-pair l)
    (if (null? (cdr l))
        (car l)
        (last-pair (cdr l))
    )
)

(newline)
(display (last-pair (list 1 2 3 "Correct")))
