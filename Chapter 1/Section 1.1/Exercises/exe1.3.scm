; Create procedure to take in 3 numbers and return the sum of the square of the
; largest two numbers

(define (square x) (* x x))

(define (sum-of-squares x y) (+ (square x) (square y)))

(define (sum-of-largest-two a b c)
    (cond ((and (< a b) (< a c)) (sum-of-squares b c))
          ((and (< b a) (< b c)) (sum-of-squares a c))
          (else (sum-of-squares a b))
    )
)

(if (= (sum-of-largest-two 1 2 3) 13)
    (display "Correct")
    (display "Wrong")
)

; Alternative implementation

(define (larger x y) (if (> x y) x y))

(define (smaller x y) (if (< x y) x y))

(define (square x) (* x x))

(define (sum-of-square-of-largest-two x y z)
    (+ (square (larger x y))
       (square (larger (smaller x y) z))
    )
)