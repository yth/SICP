; Exercise 2.39

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

(define nil '())

(define (reverse1 sequence)
    (fold-right (lambda (x y) (append y (list x))) nil sequence)
)

(define (reverse2 sequence)
    (fold-left (lambda (x y) (append (list y) x)) nil sequence)
)

(newline)
(display (reverse1 (list 3 2 1)))
(newline)
(display (reverse2 (list 3 2 1)))