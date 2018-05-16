; sqrt code form book
(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)
    )
)

(define (improve guess x)
    (average guess (/ x guess))
)

(define (average x y)
    (/ (+ x y) 2)
)

(define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001)
)

(define (sqrt x) (sqrt-iter 1.0 x))

; new-if code from exercise 1.6

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)
  )
)

; sqrt-iter using new if from book
(define (sqrt-iter2 guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter2 (improve guess x)
                     x)))
                 
(define (sqrt2 x) (sqrt-iter2 1.0 x))

(display (sqrt 1000))

; The following output will never be seen.
; Instead, there will be an error message about max recursion depth reached.

(display (sqrt2 1000))

; new-if is not a special form. It will use applicative-order evaluation.
; It will evaluate the operator and operand(s) before applying operator to the
; operands. When it evaluate the alternative expression of new-if, it will need
; evaluate it's sub-expressions as well. As the result, it will fall into an
; endless cycle of evaluating the sub-expression.