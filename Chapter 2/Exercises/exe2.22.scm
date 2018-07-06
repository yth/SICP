; Exercise 2.22

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) 
              (cons (square (car things))
                    answer))))
  (iter items '()))

(newline)
(display (square-list (list 1 2 3 4)))

; The above method reverse the list in addition to square its member because the
; the cons put the squared value in front of previous squared values.

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items '()))

(newline)
(display (square-list (list 1 2 3 4)))

; Simply reorder the cons will produce the correct order of the numbers.
; However, '() is an empty list. Consing to '() will add the item behind
; '(). Here, we need append.
(define (square-list items)
    (define (iter things answer)
        (if (null? things)
            answer
            (iter (cdr things)
                (append
                    answer
                    (list (square (car things)))
                )
            )
        )
    )

    (iter items '())
)

(newline)
(display (square-list (list 1 2 3 4)))