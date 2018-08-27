; flatmap

(define nil '())

(define (enumerate-interval low high)
    (if (> low high)
        nil
        (cons low (enumerate-interval (+ low 1) high))
    )
)

; test
(newline)
(display (enumerate-interval 2 7))

#|
(accumulate
    append
    nil
    (map
        (lambda (i)
            (map
                (lambda (j) (list i j)) 
                (enumerate-interval 1 (- i 1))
            )
        )
    
        (enumerate-interval 1 n)
    )
)
|#


