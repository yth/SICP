; Two different ways to define addition
; Assess if they generate a recursion or iteration process

; Recursive process
(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))

; Iterative process
(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))
