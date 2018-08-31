; example 1
(define (sum-integers a b)
    (if (> a b)
        0
        (+ a 
           (sum-integers (+ a 1) b))
    )
)

; example 2
(define (sum-cubes a b)
    (if (> a b)
        0
        (+ (cube a) 
           (sum-cubes (+ a 1) b))
    )
)

; example 3
(define (pi-sum a b)
    (if (> a b)
        0
        (+ (/ 1.0 (* a (+ a 2))) 
           (pi-sum (+ a 4) b))
    )
)

; pattern

; (define (<name> a b)
;   (if (> a b)
;       0
;       (+ (<term> a)
;          (<name> (<next> a) b))
;   )
; )

; a and b denotes lower and upper bound
; term process the nth term in the range
; next generate the next term to be used as lower bound
; the previous term is put into queue to be accumulated in a recursive process
(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
           (sum term (next a) next b))
    )
)

; example 4
(define (inc n) (+ n 1))
(define (cube x) (* x x x))
(define (sum-cubes a b) (sum cube a inc b))

(define (assert-eq exp1 exp2)
    (if (= exp1 exp2)
        (display "True")
        (display "False")
    )
)

(assert-eq (sum-cubes 1 10) 3025)

; example 5
(define (integral f a b dx)
    (define (add-dx x) (+ x dx))
    (* 
        (sum f (+ a (/ dx 2.0)) add-dx b) dx
    )
)

(newline)
(display (integral cube 0 1 0.0001))