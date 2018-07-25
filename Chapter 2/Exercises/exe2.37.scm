; Exercise 2.37

(define nil '())

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
    (if (null? (car seqs))
        nil
        (cons (accumulate op init (map car seqs))
              (accumulate-n op init (map cdr seqs)))
    )
)

; Example
(define (dot-product v w)
  (accumulate + 0 (map * v w)))

; Exercise
(define (matrix-*-vector m v)
    (map (lambda (row) (list (dot-product row v))) m)
)

(define m (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
(define v (list 1 2 3 4))
(newline)
(display (matrix-*-vector m v))

#|
(define (transpose mat)
    (accumulate-n <??> <??> mat)
)

(define (matrix-*-matrix m n)
    (let 
        (
            (cols (transpose n))
        )

        (map <??> m))
)
|#
