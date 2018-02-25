(define tolerance 0.001)

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)
  )
)

(define (sqrt-iter guess x)
  (cond ((good-enough2? guess x) guess)
        (else (sqrt-iter (improve guess x) x))
  )
)

(define (good-enough? guess x)
  (if (< (abs (- (square guess) x)) tolerance)
    #t
    #f
  )
)

(define (good-enough2? guess x)
  (if (< (abs (- guess (improve guess x))) (/ guess 1000))
    #t
    #f
  )
)

(define (square x) (* x x))

(define (improve guess x)
  (average guess (/ x guess))
)

(define (average x y) (/ (+ x y) 2))

; (define (sqrt x) (sqrt-iter (/ x 2) x))

(define (sqrt x) (sqrt-iter 1 x))

(display (sqrt 2.0))
(newline)
