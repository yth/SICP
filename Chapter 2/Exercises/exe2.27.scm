; Exercise 2.27

(define x (list (list 1 2) (list 3 4)))

(define (deep-reverse x)
    (if (null? x)
        x
        (append
            (deep-reverse (cdr x))
            (if (list? (car x))
                (deep-reverse (car x))
                (list (car x))
            )
        )
    )
)

(newline)
(display (reverse x))

(newline)
(display (deep-reverse x))
