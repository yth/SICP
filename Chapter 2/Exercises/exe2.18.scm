; Exercise 2.18

(define (reverse l)
    (if (null? l)
        l
        (append (reverse (cdr l)) (list (car l)))
    )
)

(newline)
(display (reverse (list 'correct 3 2 1)))
