; Using (x/y^2 + 2y) / 3 to improve guess

(define tolerance 0.001)

(define (cube x) (* x x x))

(define (square x) (* x x))

(define (curt-iter guess x)
    (if (good-enough? guess x)
        guess
        (curt-iter (improve guess x) x)
    )
)

(define (good-enough? guess x)
    (< (abs (- x (cube guess))) tolerance)
)

(define (improve guess x)
    (/ (+ (/ x (square guess)) (* 2 guess))
       3
    )    
)

(define (curt x) (curt-iter 1.0 x))

(newline)
(display (curt 8))

;; ex 1.8. Based on the solution of ex 1.7. 

#|  
(define (cube-root-iter guess prev-guess x) 
   (if (good-enough? guess prev-guess) 
       guess 
       (cube-root-iter (improve guess x) guess x))) 
  
 (define (improve guess x) 
   (average3 (/ x (square guess)) guess guess)) 
  
 (define (average3 x y z) 
   (/ (+ x y z) 3)) 
  
 ;; Stop when the difference is less than 1/1000th of the guess 
 (define (good-enough? guess prev-guess) 
   (< (abs (- guess prev-guess)) (abs (* guess 0.001)))) 
  
 (define (cube-root x) 
   (cube-root-iter 1.0 0.0 x)) 
  
 ;; Testing 
 (cube-root 1) 
 (cube-root -8) 
 (cube-root 27) 
 (cube-root -1000) 
 (cube-root 1e-30) 
 (cube-root 1e60) 
 ;; this fails for -2 due to zero division :( 
  
 ;; Fix: take absolute cuberoot and return with sign 
  
 ;;(define (cube-root x) 
 ;;  ((if (< x 0) - +)(cube-root-iter (improve 1.0 (abs x)) 1 (abs x))))

|#