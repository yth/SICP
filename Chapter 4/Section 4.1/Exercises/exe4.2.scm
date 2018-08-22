; Exercise 4.2

; Part a
;
; (define x 3) will be evaluated as an expression.
;
; Special forms will not be recognized.

; Part b
; 
; If we want to force the issue, the implementation might be something like
; below.
;
; (define (application? exp) (tagged-list? exp 'call))
; (define (operator exp) (cadr exp))
; (define (operand exp) (cddr exp))
;
; The rest would be as before.
