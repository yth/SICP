; Exercises from Chapter 1 of SICP


; Helper Functions

; (define (check expression value) (if (= (eval expression) value) (display "True" (newline)) (display "False" (newline))

; 1.1



(display 10) ; 10
(newline)
(display 10) ; 10
(newline)

(display (+ 5 3 4)) ; 12
(newline)
(display 12)
(newline)

(display (- 9 1)) ; 8
(newline)
(display 8)
(newline)

(/ 6 2) ; 3
(newline)

(+ (* 2 4)
   (- 4 6)
) ; 10
(newline)

(define a 3) ; a == 3
(newline)

(define b (+ a 1)) ; b == 4
(newline)

(+ a b (* a b)) ; 19
(newline)

(= a b) ; #f
(newline)

; 1.3

(define (larger x y) (if (> x y) x y))

(define (smaller x y) (if (< x y) x y))

(define (square x) (* x x))

(define (sum-of-square-of-largest-two x y z) (+ (square (larger x y)) (square (larger (smaller x y) z))))

(display (sum-of-square-of-largest-two 1 2 3)) 
(newline)
