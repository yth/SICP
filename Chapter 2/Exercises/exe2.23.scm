(define (for-each proc seq)
    (if (null? seq)
        seq
        (begin
            (proc (car seq))
            (for-each proc (cdr seq))
        )
    )
)

(for-each (lambda (x) (newline) (display x)) (list 57 321 88))
