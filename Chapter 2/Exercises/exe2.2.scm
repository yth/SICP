(define (make-point x y) (cons x y))

(define (x-point point) (car point))

(define (y-point point) (cdr point))

(define (make-segment start end) (cons start end))

(define (start-segment segment) (car segment))

(define (end-segment segment) (cdr segment))

(define (print-point p)
    (newline)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")")
)

(define (average x y) (/ (+ x y) 2))

(define (midpoint-segment segment)
    (print-point
        (make-point
            (average (x-point (start-segment segment))
                     (x-point (end-segment segment)))
            (average (y-point (start-segment segment))
                     (y-point (end-segment segment)))
        )
    )    
)

(define origin (make-point 0 0))

(define origin-segment (make-segment origin origin))

(midpoint-segment origin-segment)

(define ones (make-point 1 1))

(midpoint-segment (make-segment origin ones))
