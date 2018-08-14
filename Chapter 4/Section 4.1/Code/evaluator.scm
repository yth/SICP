(define (eval exp env)
    (cond
        ((self-evaluating? exp) exp)
        ((variable? exp) (look-up-variable-value exp env))
        ((quoted? exp) (text-of-quotation exp))
        ((assignment? exp) (eval-assignment exp env))
        ((definition? exp) (eval-definition exp env))
        ((if? exp) (eval-if exp env))
        ((lambda? exp)
            (make-procedure (lambda-parameters exp)
                            (lambda-body exp)
                            env
            )
        )
        ((begin? exp) (eval-sequence (begin-actions exp) env))
        ((cond? exp) (eval (cond->if exp) env))
        ((application? exp)
            (apply (eval(operator exp) env)
                   (list-of-values (operands exp) env)
            )
        )
        (else (error "Unknown expression type -- EVAL" exp))
    )
)

(define (apply procedure arguments)
    (cond
        ((primitive-procedure? procedure)
            (apply-primitive-procedure procedure arguments)
        )
        ((compound-procedure? procedure)
            (eval-sequence
                (procedure-body procedure)
                (extend-environment
                    (procedure-parameters procedure)
                    arguments
                    (procedure-environments procedure))
            )
        )
        (else (error "Unknown procedure type -- APPLY" procedure))
    )
)

; list-of-value is implemented in such a way that it does not require higher
; order functions.
;
; It's also interesting to note that it has the general shape of an accumulate
; function.

(define (list-of-values exps env)
    (if (no-operands? exps)
        '()
        (cons (eval (first-operand exps) env)
              (list-of-values (rest-operands exps) env))
    )
)

(define (eval-if exp env)
    (if (true? (eval (if-predicate exp) env))
        (eval (if-consequent exp) env)
        (eval (if-alternative exp) env)
    )
)

(define (eval-sequences exps env)
    (cond 
        ((last-exp? exps) (eval (first-exp exps) env))
        (else (eval (first-exp exps) env) (eval-sequence (rest-exps exps) env))
    )
)

(define (eval-assignment exp env)
    (set-variable-value! 
        (assignment-variable exp)
        (eval (assignment-value exp) env)
        env
    )
    'ok
)

(define (eval-definition exp env)
    (define-variable!
        (definition-variable exp)
        (eval (definition-value exp) env)
        env
    )
    'ok
)

; Determine what's being evaluation

(define (self-evaluating? exp)
    (cond
        ((number? exp) true)
        ((string? exp) true)
        (else false)
    )
)

(define (variable? exp) (symbol? exp))

(define (quoted? exp) (tagged-list? exp 'quote))

(define (tagged-list? exp tag)
    (if (pair? exp)
        (eq? (car exp) tag)
        false
    )
)

(define (text-of-quotation exp) (cadr exp)) ; Why not just (cdr exp)?


