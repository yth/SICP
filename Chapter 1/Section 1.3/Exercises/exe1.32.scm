; Generalized accumulate

(define (accumulate combiner null-value term a next b)
    (if (> a b)
        null-value
        (accumulate combiner 
                    (combiner null-value (term a)) 
                    term 
                    (next a) 
                    next
                    b
        )
    )
)

(define (sum term a next b)
    (accumulate + 0 term a next b)
)

(define (product term a next b)
    (accumulate * 1 term a next b)    
)

; Experiment using cube
(define (cube x) (* x x x))

; n must if even for Simpson's Rule
(define (simpsons f a b n)
    (define h (/ (- b a) n))
    (define (term k) (f (+ a (* k h))))
    (define (next k) (+ k 2))
    (* (/ h 3.0)
        (+ (f a)
           (f b)
           (* 4 (sum term 1 next n))
           (* 2 (sum term 2 next n))
        )
    )
)

(newline)
(display (simpsons cube 0 1 1000)) ; expect something around 1/4