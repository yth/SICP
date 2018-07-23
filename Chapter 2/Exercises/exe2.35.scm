; Exercise 2.35

(define nil '())

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

; enumerate-tree procedure from SICP, but now named more honestly
(define (enumerate-leaves tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-leaves (car tree))
                      (enumerate-leaves (cdr tree))))))

(define (count-leaves t)
    (accumulate
        +
        0 
        (map (lambda (x) 1) (enumerate-leaves t))
    )
)

(display (count-leaves (list 1 (list 2 (list 3 4)) 5)))
