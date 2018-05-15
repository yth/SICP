; Describe behavior of the following procedure

(define (a-plus-abs-b a b)
    ((if (> b 0) + -) a b))

; a + abs(b)

(if (= (a-plus-abs-b 1 2) 3)
    (display "Correct")
    (display "Wrong")
)

(if (= (a-plus-abs-b 1 -2) 3)
    (display "Correct")
    (display "Wrong")
)
