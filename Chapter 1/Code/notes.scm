(define (square x) (* x x))

(define (sum-of-square x y) (+ (square x) (square y)))

(define (f a) (sum-of-square (+ a 1) (* a 2)))

(define (abs x)
    (cond
        ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))
    )
)

(define (abs x)
    (cond
        ((< x 0) (- x))
        (else x)
    )
)

(define (abs x)
    (if (< x 0)
        (- x)
        x
    )
)

(define (>= x y)
    (or (> x y) (= x y))
)

(define (>= x y)
    (not (< x y)
)

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
    (< (abs (- (square guess) x)) 0.001)    
)

(define (sqrt x) (sqrt-iter 1.0 x))

(define (factorial n)
    (if (= n 1)
        1
        (* n (factorial (- n 1)))
    )
)

(define (factorial n)
    (define (fact-iter product counter max-count)
        (if (> counter max-count)
            product
            (fact-iter (* counter product)
                    (+ counter 1)
                    (max-count)
            )
        )
    )

    (fac-iter 1 1 n)
)

(define (fib n)
    (cond
        ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))
              )
        )
    )
)

(define (fib n)
    (define (fib-iter a b count)
        (if (= counter 0)
            b
            (fib-iter (+ a b) a (- count 1))
        )
    )

    (fib-iter 1 0 n)
)
