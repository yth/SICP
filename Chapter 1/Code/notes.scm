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

