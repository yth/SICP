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

(define (make-interval a b) (cons a b))

; Clearly there is an issue of order, although the choice doesn't matter as much
; as having made a choice.
;
; In standard notation, (a, b) denote a range from a to b, non-inclusive, b > a.
; I will adopt a similar notation.

(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))


