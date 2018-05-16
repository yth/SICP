(define (p) (p))

(define (test x y)
    (if (= x 0)
        0
        y
    )
)

(test 0 (p))

; If applicative-order evaluation is used, (p) will keep expanding. As the
; result, we would never get the result of the test expression. If
; normal-order evaluation is used, (p) would never be evaluated when x := 0.

(display "Applicative-order evaluation is used!")

; If I am correct, the above will never be displayed if we load this file into
; the scheme interpreter.
