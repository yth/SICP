(define (cons x y)
    (lambda (m) (m x y))
)

(define (car z)
    (z (lambda (p q) p))
)

; cdr

(define (cdr z)
    (z (lambda (p q) q))
)

; testing

(define (point x y) (cons x y))

(define pt (point 1 2))

(newline)
(display "(")
(display (car pt))
(display ", ")
(display (cdr pt))
(display ")")
