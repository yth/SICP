; Exercise 2.40

(load "../Code/flatmap.scm")

(define (unique-pairs n)
    (flatmap 
        (lambda (i)
            (map
                (lambda (j)
                    (list i j)
                )

                (enumerate-interval 1 (- i 1))
            )    
        )

        (enumerate-interval 1 n)             
    )
)

; Testing

(newline)
(display (unique-pairs 10))

; Simplified prime-sum-pairs

(define (prime-sum-pairs n)
    (map make-pair-sum
        (filter prime-sum?
            (unique-pairs n)
        )
    )
)

; Testing

(newline)
(newline)
(display (prime-sum-pairs 10))