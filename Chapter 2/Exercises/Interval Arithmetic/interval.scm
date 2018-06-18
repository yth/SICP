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


