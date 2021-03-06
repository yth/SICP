; Exercise 2.28

(define x (list (list 1 2) (list 3 4)))

(define (fringe x)
    (cond
        ((null? x) '())
        ((pair? x) (append (fringe (car x)) (fringe (cdr x))))
        (else (list x))
    )
)

(newline)
(display (fringe x))
(newline)
(display (fringe (list x x)))
