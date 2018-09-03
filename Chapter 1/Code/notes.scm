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

; https://mitpress.mit.edu/sites/default/files/sicp/full-text/book/book-Z-H-10.html
