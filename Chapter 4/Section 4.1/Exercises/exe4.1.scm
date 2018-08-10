#|
(define (list-of-values exps env)
    (if (no-operands? exps)
        '()
        (cons 
            (eval (first-operand exps) env)
            (list-of-values (rest-operands exps) env)
        )
    )
)
|#

; To change the order of evaluation, it seems like we just need to change the
; order of eval. However, Scheme is an applicative order language, so that we
; also need some mechanism to force the evaluation before evaluating the
; function creates a different order of evaluation.

#| Left to right evaluation
(define (list-of-values exps env)
    (if (no-operands? exps)
        '()
        (let
            (first (eval (first-operand exps)))
            (rest (list-of-values (rest-operands exps) env))
            (cons first rest)
        )
    )
)
|#

; for right to left evaluation, it would be best to reverse to order of exps.
