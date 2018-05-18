; Using (x/y^2 + 2y) / 3 to improve guess
; Using a fixed tolerance

(define tolerance 0.0001)

(define (cube x) (* x x x))

(define (square x) (* x x))

(define (curt-iter guess x)
    (if (good-enough? guess x)
        guess
        (curt-iter (improve guess x) x)
    )
)

(define (good-enough? guess x)
    (< (abs (- x (cube guess))) tolerance)
)

(define (improve guess x)
    (/ (+ (/ x (square guess)) (* 2 guess))
       3
    )    
)

(define (curt x) (curt-iter 1.0 x))

; simple test
(newline)
(display (curt 1))(newline)
(display (curt 8))(newline)
(display (curt -8))(newline)
(display (curt 27))(newline)
(display (curt -1000))(newline)
(display (curt 1e-30))(newline)
(display (curt 1e60))(newline)

; ex 1.8. Based on the solution of ex 1.7. 
; Using a percentage change tolerance

(define (good-enough2? guess x)
    (< (/ (abs (- (improve guess x) guess)) (abs guess))
        tolerance
    )
)

(define (curt-iter2 guess x)
    (if (good-enough2? guess x)
        guess
        (curt-iter2 (improve guess x) x)
    )
)

(define (curt2 x) (curt-iter2 1.0 x))
  
; simple test
(display (curt2 1))(newline)
(display (curt2 8))(newline)
(display (curt2 -8))(newline)
(display (curt2 27))(newline)
(display (curt2 -1000))(newline)
(display (curt2 1e-30))(newline)
(display (curt2 1e60))(newline)