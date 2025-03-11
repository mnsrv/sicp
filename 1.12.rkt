(define (solution row col)
  (cond ((= row 1) 1)
        ((= col 1) 1)
        ((= col row) 1)
        (else (+ (solution (- row 1) (- col 1))
                 (solution (- row 1) col)))))

(solution 1 1) ; 1
(solution 2 1) ; 1
(solution 2 2) ; 1
(solution 3 1) ; 1
(solution 3 2) ; 2
(solution 3 3) ; 1
(solution 4 2) ; 3
(solution 4 3) ; 3
(solution 5 3) ; 6
