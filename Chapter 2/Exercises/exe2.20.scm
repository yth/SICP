(define (same-parity first . rest)
    (define l (append (list first) rest))
    (define test (if (odd? first) odd? even?))

    (define (same-parity-recr l test)
        (if (null? l)
            l
            (if (test (car l))
                (append (list (car l)) (same-parity-recr (cdr l) test))
                (same-parity-recr (cdr l) test)
            )
        )
    )

    (same-parity-recr l test)
)

(newline)
(display (same-parity 1 2 3 4 5 6 7 8 9))
(display (same-parity 2 3 4 5 6 7 8 9 10))