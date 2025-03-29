(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (even? n)
  (= (remainder n 2) 0))
(define (fib-iter a b p q count)
  (display a) (display ", ") (display b) (display ", ") (display p) (display ", ") (display q) (display ", ") (display count) (newline)
  (cond ((= count 0) b)
         ((even? count)
          (fib-iter a
                    b
                    (+ (* p p) (* q q))
                    (+ (* 2 p q) (* q q))
                    (/ count 2)))
         (else (fib-iter (+ (* b q) (* a q) (* a p))
                         (+ (* b p) (* a q))
                         p
                         q
                         (- count 1)))))
(fib 10)


(define (fib-old n)
  (fib-old-iter 1 0 n))
(define (fib-old-iter a b count)
  (if (= count 0)
      b
      (fib-old-iter (+ a b) a (- count 1))))

(fib-old 10)