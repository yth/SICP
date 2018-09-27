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

#| ; Name protection, and lexical scoping
(define (sqrt x)
    (define (good-enough? ...))
    ...
    (sqrt-iter 1.0 x)
)
|#

; Counter Change

(define (count-change amount)
    (cc amount 5)    
)

(define (cc amount kinds-of-coins)
    (cond
        ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else
            (+ (cc amount (- kinds-of-coins 1))
               (cc (- amount (first-denomination kinds-of-coins)) kinds-of-coins)
            )
        )
    )    
)

(define (first-denomination kinds-of-coins)
    (cond
        ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)
    )    
)

