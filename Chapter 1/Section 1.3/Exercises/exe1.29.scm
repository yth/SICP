; Using sum from the book
(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
           (sum term (next a) next b))
    )
)

; Experiment using cube
(define (cube x) (* x x x))

; https://en.wikipedia.org/wiki/Simpson%27s_rule#Composite_Simpson's_rule

; n must if even for Simpson's Rule
(define (simpsons f a b n)
    (define h (/ (- b a) n))
    (define (term k) (f (+ a (* k h))))
    (define (next k) (+ k 2))
    (* (/ h 3.0)
        (+ (f a)
           (f b)
           (* 4 (sum term (+ a 1) next b))
           (* 2 (sum term (+ a 2) next b))
        )
    )
)

(display (simpsons cube 0 1 1000)) ; expect something around 1/4