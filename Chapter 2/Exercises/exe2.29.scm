; Exercise 2.29

; a
(define (make-branch length structure)
    (list length structure)
)

(define (length branch)
    (car branch)
)

(define (structure branch)
    (car (cdr branch))
)

(define a-branch (make-branch 1 1))
(define b-branch (make-branch 2 2))
(newline)
(display (length a-branch))
(newline)
(display (structure b-branch))
(newline)


(define (make-mobile left-branch right-branch)
    (list left-branch right-branch)
)

(define (left-branch mobile)
    (car mobile)
)

(define (right-branch mobile)
    (car (cdr mobile))
)

(define a-mobile (make-mobile a-branch b-branch))
(display (left-branch a-mobile))
(newline)
(display (right-branch a-mobile))
(newline)

; b
(define (total-weight mobile)
    (+ (branch-weight (left-branch mobile))
       (branch-weight (right-branch mobile))
    )
)

(define (branch-weight branch)
    (if (pair? (structure branch))
        (total-weight branch)
        (structure branch)
    )
)

(display (branch-weight a-branch))
(newline)
(display (branch-weight b-branch))
(newline)
(display (total-weight a-mobile))
(newline)

; c

(define (torque branch)
    (* (length branch) (branch-weight branch))    
)

(display (torque a-branch))
(newline)
(display (torque b-branch))
(newline)

(define (balanced-mobile? mobile)
    (and
        (balanced-branch? (left-branch mobile))
        (balanced-branch? (right-branch mobile))
        (= (torque (left-branch mobile)) (torque (right-branch mobile)))
    )
)

(define (balanced-branch? branch)
    (if (pair? (structure branch))
        (balance-mobile? (structure branch))
        #t
    )
)

(define b-mobile (make-mobile a-branch a-branch))
(display (balanced-mobile? b-mobile))

; part d
;
; Not very much.
; I would not need to add an additional car to reference into the right branch.