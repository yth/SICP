; Book code for sqrt

(define tolerance 0.001)

(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)
    )
)

(define (improve guess x)
    (average guess (/ x guess))
)

(define (average x y)
    (/ (+ x y) 2)
)

(define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001)
)

(define (sqrt x) (sqrt-iter 1.0 x))

; Old Procedure
(newline)
(display "Using 0.001 as tolerance")

; when number is too small

(define small-number 1e-10)

(newline)
(display "small number: ")
(display small-number)
(newline)
(display "square root of small number (calculated by sqrt): ")
(display (sqrt small-number))
(newline)
(display "(square (sqrt small-number)):")
(display (square (sqrt small-number)))
(newline)

; When the number is small, it's too easy for a test value to fall within
; "tolerance".

; when number is too big
(define large-number 1e21)

(display "large number: ")
(display large-number)
(newline)
(display "square root of large number (calculated by sqrt): ")
;(display (sqrt large-number))
(newline)
(display "square the square root: ")
; (display (square (sqrt large-number)))

; When the number is too big, the procedure might become stuck in a loop. It
; will keep guessing values that are outside of tolerance. Each successive guess
; will overcompensate because the base value is so big, and never get to a value
; that's within tolerance.

; The lines that causes the infinite loop is commented out.

; A better procedure might use tolerance based on a % change from one iteration
; to the next.

; If the next guess is significantly better, keep going.

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

(define (sqrt2 x) (sqrt-iter2 1.0 x))

; New Procedure
(newline)
(display "Using 0.1 % change as tolerance")

; when number is too small
(newline)
(display "small number: ")
(display small-number)
(newline)
(display "square root of small number (calculated by sqrt2): ")
(display (sqrt2 small-number))
(newline)
(display "(square (sqrt small-number)):")
(display (square (sqrt2 small-number)))
(newline)

; When the number is small, it's too easy for a test value to fall within
; "tolerance".

; when number is too big
(display "large number: ")
(display large-number)
(newline)
(display "square root of large number (calculated by sqrt2): ")
(display (sqrt2 large-number))
(newline)
(display "square the square root: ")
(display (square (sqrt2 large-number)))