(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

(f 1) ; 1
(f 2) ; 2
(f 3) ; 4
(f 4) ; 11
(f 5) ; 25
(f 6) ; 59

(define (f-iter n)
  (define (f-loop n-1 n-2 n-3 nth)
    (if (= n nth)
        n-1
        (f-loop (+ n-1 (* 2 n-2) (* 3 n-3))
                n-1
                n-2
                (+ 1 nth))))
  (if (< n 3)
      n
      (f-loop 2 1 0 2)))
(f-iter 3) ; 4
(f-iter 4) ; 11
(f-iter 5) ; 25
(f-iter 6) ; 59