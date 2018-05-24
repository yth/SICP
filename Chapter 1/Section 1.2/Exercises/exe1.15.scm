; Create procedure for finding sine.
;
; Ideas used:
;
; sin(x) = x, when x is sufficiently small
;
; sin(x) = 3 * sin(x/3) - 4 * sin^3(x/3)
;
; Givens:
;
; Assume angle is sufficently small if it's less than .1 radians

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
    (if (not (> (abs angle) 0.1))
        angle
        (p (sine (/ angle 3.0)))
    )
)

; a) How many times is the procedure p applied when (sine 12.15) is called?
;
;    0.1 >= 12.15 / (3.0)^n, the smallest value that n can be is the number of
;    times when p is applied when (sine 12.15) is called.
;
; b) What is the order of growth in space and number of steps (as a function of
;    a) used by the process generated by the sine procedure when (sine a) is
;    evaluated?
;
;    The order of growth for the number of steps when (sine a) is evaluated as a
;    becomes large is O(log(a)).
;
;    The order of growth for the space required by (sine a) as a becomes large
;    is O(a).