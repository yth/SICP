; Exercise 2.32

(define nil '())

(define (subsets s)
    (if (null? s)
        (list nil)
        (let ((rest (subsets (cdr s))))
            (append rest (map (lambda (x) (append (list (car s)) x)) rest))
        )
    )
)

(display (subsets (list 1 2 3)))
