; (x/y^2 + 2y) / 3 is the improved guess

(define (curt x) (curt-iter 1.0 x))

(define (curt-iter guess x)
  (if (good-enough2? guess x)
    guess
    (improve guess x)
  )
)

(define (good-enough? guess x)
  (if (< (abs (- x (cube guess))) tolerance)
    #t
    #f
  )
)

(define (good-enough2? guess x)
  (if (< (abs (- guess (improve guess x))) (abs (/ guess 1000)))
    #t
    #f
  )
)

(define (cube x) (* x x x))

(define tolerance 0.0001)

(define (improve guess x)
  (/ (+ (/ x guess guess) (* 2 guess)) 3)
)

(display (curt 8))
(newline)
