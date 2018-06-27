; All exercises from the extended exercise: interval arithmetic will be
; contained in this document

#|
; Initial Example for understanding
(define r1 6.8)
(define r2 4.7)

(define (rp ri rj) (/ 1 (+ (/ 1 ri) (/ 1 rj))))

(newline)
(display "Calculated Resistance: ")
(display (rp r1 r2))

(define t1 .1)
(define t2 .05)

(define (min-val r t) (* r (- 1 t)))
(define (max-val r t) (* r (+ 1 t)))

(newline)
(display "Lower Resistance: ")
(display (rp (min-val r1 t1) (min-val r2 t2)))

(newline)
(display "Upper Resistance: ")
(display (rp (max-val r1 t1) (max-val r2 t2)))
|#

(define (add-interval x y)
    (make-interval (+ (lower-bound x) (lower-bound y))
                   (+ (upper-bound x) (upper-bound y))
    )
)

(define (mul-interval x y)
    (let 
        (
            (p1 (* (lower-bound x) (lower-bound y)))
            (p2 (* (lower-bound x) (upper-bound y)))
            (p3 (* (upper-bound x) (lower-bound y)))
            (p4 (* (upper-bound x) (upper-bound y)))
        )

        (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))
    )
)

(define (div-interval x y)
    (mul-interval x
        (make-interval (/ 1.0 (upper-bound y)) (/ 1.0 (lower-bound y)))
    )
)

; Exercise 2.7

(define (make-interval a b) 
    (if (< a b)
        (cons a b)
        (cons b a)
    )
)

; Clearly there is an issue of order, although the choice doesn't matter as much
; as having made a choice.
;
; In standard notation, (a, b) denote a range from a to b, non-inclusive, b > a.
; I will adopt a similar notation.

(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))

; Exercise 2.8
;
; Subtraction usually is the inverse of addition. If addition is to add the
; lower bounds and upper bounds with together with their like, then subtraction
; would should do the same.
;
; However, there is a possibility that the resulting upper bound might be lower
; than the resulting lower bound, so I should modify the constructor to set the
; lower value to be the lower bound, and the higher value to be the upper bound.

(define (sub-interval x y)
    (make-interval
        (- (lower-bound x) (lower-bound y))
        (- (upper-bound x) (upper-bound y))
    )
)

; Exercise 2.9
;
; In cases of additional and subtraction, the lower-bounds are added together or
; one is subtracted from the other. It is the same for upper-bound. The result
; gives the new interval for where the combined estimated value reside.
; The resulting width of the new interval after addition and subtraction depend
; on the width of the interval involved in the operation.
;
; In cases of multiplication and division, the boundary value plays the primary
; role. The result of the operation depends on the boundary values rather than
; the width value.

; Exercise 2.10

(define (div-interval x y)
    (if (= 0 (- (upper-bound y) (lower-bound y)))
        (display "Divide by Zero Error")
        (mul-interval x
            (make-interval (/ 1.0 (upper-bound y)) (/ 1.0 (lower-bound y)))
        )
    )
)

; Exercise 2.11
;
; Skipped at this reading

; Exercise 2.12
;
; Skipped at this reading

; Exercise 2.13
;
; Skipped at this reading

; Exercise 2.14
;
; Skipped at this reading

; Exercise 2.15
;
; Skipped at this reading

; Exercise 2.16
;
; The fundamental issue seems to be that interval arithmetic does not obey the
; same rules as regular arithmetic. In other words, intervals and interval
; operations does not make a field. To get "correct" answer we want, we can use
; other techniques like minimizing the number of interval operations evaluated
; in the process. However, that gets us into the problem of generalizing such a
; method. This is very hard. We are trying to take arbitrary computations and
; reduce it so that each interval variable is independent from each other.
