(load "flatmap.scm")

(define (remove item sequence)
    (filter
        (lambda (x) (not (= x item)))
        sequence
    )
)


(define (permutation s)
    (if (null? s)
        (list '())
        (flatmap
            (lambda (x) 
                (map
                    (lambda (p) (cons x p))
                    (permutation (remove x s))
                )
            )
            s
        )
    )
)

(newline)
(display "Permutations of (1 2 3)")
(display (permutation (list 1 2 3)))