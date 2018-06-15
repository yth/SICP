(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
    (lambda (f) (lambda (x) (f ((n f) x)))))

; It seems zero takes a function as an argument and apply it 0 times
; add-1 seems to take a function like zero as an argument, and apply 1 more time
; than the underlying function.

(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

; Testing

(define double (lambda (x) (+ x x)))

(newline)
(display ((zero double) 1)) 
(newline)
(display (((add-1 zero) double) 1))
(newline)
(display ((one double) 1)) 
(newline)
(display (((add-1 one) double) 1))
(newline)
(display ((two double) 1))
