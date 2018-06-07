(define make-rat
    (lambda (n d)
        (define g (gcd n d))
        (if (negative? (* n d))
            (cons (* -1 (/ (abs n) g)) (/ (abs d) g))
            (cons (/ (abs n) g) (/ (abs d) g))
        )
    )
)

(define (numer rat) (car rat))
(define (denom rat) (cdr rat))

(define tenth (make-rat 1 -10))

(newline)
(display "(make-rat 1 -10)")
(newline)
(display "numerator: ")
(display (numer tenth))
(newline)
(display "denominator: ")
(display (denom tenth))