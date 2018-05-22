; Prove fib(n) is the closest integer to phi^n / sqrt(5) 

; phi = (1 + sqrt(5)) / 2

; hint: (phi^n - psi^n)/sqrt(5) = fib(n)
; hint: psi = (1 - sqrt(5)) / 2

; Using sqrt procedure from exercise 1.7

(define tolerance 0.001)

(define (improve guess x)
    (average guess (/ x guess))
)

(define (average x y)
    (/ (+ x y) 2)
)

(define (good-enough2? guess x)
    (< (/ (abs (- (improve guess x) guess)) guess)
       0.0001
    )
)

(define (sqrt-iter2 guess x)
    (if (good-enough2? guess x)
        guess
        (sqrt-iter2 (improve guess x) x)
    )
)

; Recursive definition of fib

(define (fib n)
    (if (< n 2)
        1
        (+ (fib (- n 1)) (fib (- n 2)))
    )
)

(define (sqrt x) (sqrt-iter2 1.0 x))

; Exponential function
; Useful for positive powers only

(define (exp-iter base power value counter)
    (if (= power count)
        value
        (exp base (- power 1) (* value base) (+ counter 1))
    )
)

(define (exp base power) (exp-iter base power 1 0))

; define phi and psi

(define (phi n) (exp (/ (+ 1 (sqrt 5)) (2)) n))
(define (psi n) (exp (/ (- 1 (sqrt 5)) (2)) n))

; Testing

(define (assert-eq exp result)
    (if (eq? exp result)
        ((display "True")(newline))
        ((display "False")(newline))
    )
)

; Base case

; To be the closest integer to a number, that number must be with in the range
; of (integer - .5, integer + .5). 

; The essence of the proof is that abs(psi(1)) < 1, and abs(psi(1)/sqrt(5)) < .5
; As the power increases, abs(psi(n)/sqrt(5)) will start to approach 0. This
; means that phi(n)/sqrt(5) approaches fib(n).
; Since the closest integer to phi(1)/sqrt(5) is fib(1), we can establish a base
; case. We establish psi(n) keep decreasing, and hence we can prove the closest
; integer to phi(n)/sqrt(5) is fib(n) via induction.

#|
assert-eq
(display (fib 1))
1
)

(assert-eq
(display (exp 2 4))
16
)

(display (psi 1))
(display "stop")
(newline)
(display (phi 1))
|#