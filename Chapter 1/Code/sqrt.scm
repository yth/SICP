(define tolerance 0.001)

(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)
    )
)

(define (improve guess x)
    (average guess (/ x guess))
)

(define (average x y)
    (/ (+ x y) 2)
)

(define (good-enough? guess x)
    (< (abs (- (square guess) x)) tolerance)
)

(define (sqrt x) (sqrt-iter 1.0 x))

(define (sqrt-hidden x)
    (define (good-enough? guess x)
        (< (abs (- (square guess) x)) tolerance))
    (define (average x y)
        (/ (+ x y) 2))
    (define (improve guess x)
        (average guess (/ x guess)))
    (define (sqrt-iter guess x)
        (if (good-enough? guess x)
            guess
            (sqrt-iter (improve guess x) x)))

    (sqrt-hidden 1.0 x)
)