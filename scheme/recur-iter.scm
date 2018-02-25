(define (f-recur n)
  (if (< n 3)
    n
    (+ (f-recur (- n 1)) (* 2 (f-recur (- n 2))) (* 3 (f-recur (- n 3))))
  )
)

(define (f-iter a b c counter n)
  (cond 
    ((< n 3) n)
    ((= counter n) a)
    (else (f-iter (+ a (* 2 b) (* 3 c)) a b (+ counter 1) n))
  )
)

(define (f n) (f-iter 2 1 0 2 n))
