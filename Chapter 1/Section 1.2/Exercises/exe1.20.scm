(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))
    )
)

; Evaluation of (gcd 206 40)
; (gcd 40 6)
; (gcd 4 2)
; (gcd 2 0)
; 2

; Applicative Order

; (gcd 206 40)
; ((if (= b 0) a (gcd b (remainder a b))) 206 40)
; ((if (= 40 0) 206 (gcd 40 (remainder 206 40))) 206 40)
; (gcd 40 (remainder 206 40))
; (gcd 40 6)

; One remainder operation is performed at each recursive call.

; Normative Order
; (gcd 206 40)
; ((if (= b 0) a (gcd b (remainder a b))) 206 40)
; ((if (= 40 0) 206 (gcd 40 (remainder 206 40))) 206 40)
; ((if (= 40 0)
;       206 
;       (gcd 40 (remainder 206 40))) 206 40)
;       ((if (= (remainder 206 40) 0) 40 (gcd (remainder 206 40) 
;                                              ((remainder 40 (remainder 206 40))
;                                                )))
;                                                206 40)
; ...

; At the first substitution step, one remainder operation is used.
; However, each subsequent substitution step, it will involve the previous
; remainder operations and the new remainder operations required by that step.
; 
; Each remainder operation will require it's own sub-remainder opeations as we
; get deeper into the operation. Each remainder operation takes two arguments.
; Each argument will eventually be replaced by a remainder operation.

; Thus, rather than count each remainder operation. It might be better to say
; that the growth of remainder operations is O(n^2).