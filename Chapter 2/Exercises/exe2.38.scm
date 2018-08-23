; Exercise 2.38

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence))
        )
    )
)

(define accmulate fold-right)

(define (fold-left op initial sequence)
    (define (iter result rest)
        (if (null? rest)
            result
            (iter (op result (car rest)) (cdr rest))))
    (iter initial sequence)
)

(newline)
(display (fold-right / 1 (list 1 2 3)))
(newline)
(display (fold-left / 1 (list 1 2 3)))
(newline)
(display (fold-right list '() (list 1 2 3)))
(newline)
(display (fold-left list '() (list 1 2 3)))

; fold-right and fold-left should return the same result if the binary operator
; is commutative.
;
; Example below

(newline)
(display (fold-right + 0 (list 1 2 3)))
(newline)
(display (fold-left + 0 (list 1 2 3)))
