; The orders of growth in time and space complexities depends on the number of
; kinds of change there are, as well as the amount of money to be changed.
;
; If the amount of money is large enough, there will be many layers where the
; procedure will generate as many recursive calls as there are different kinds
; of coins.
;
; If the amount is a, to use the same notation as SICP, and let's use d to
; denote the different kinds of denominations of coins we have, then the time
; complexity growth is growth is O(a^d).
;
; Assuming that this is a single thread process, and there are no unseen
; multiprocessing optimizations underneath, each new recursive call only need to
; track the caller that generated. Thus, the amount of space complexity growth
; is only proportional to the maximum depth of the tree, which is a, since the
; greatest depth is reached by line where a is changed into pennies.
