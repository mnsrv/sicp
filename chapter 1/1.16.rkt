; Exercise 1.16: Design a procedure that evolves an iterative exponentiation process that uses successive squaring and uses a logarithmic number of steps, as does fast-expt. (Hint: Using the observation that (bn/2)2 = (b2)n/2, keep, along with the exponent n and the base b, an additional state variable a, and define the state transformation in such a way that the product abn is unchanged from state to state. At the beginning of the process a is taken to be 1, and the answer is given by the value of a at the end of the process. In general, the technique of defining an invariant quantity that remains unchanged from state to state is a powerful way to think about the design of iterative algorithms.)
(define (expt b n)
  (display "step: ") (display n) (newline)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))
(expt 2 20) ; 21 steps

(define (expt-iter b n)
  (define (expt-step b counter product)
    (display "step: ") (display b) (display ", ") (display counter) (display ", ") (display product) (newline)
    (if (= counter 0)
        product
        (expt-step b
                   (- counter 1)
                   (* b product))))
  (expt-step b n 1))
(expt-iter 2 10)

(define (square n)
  (* n n))
(define (even? n)
  (= (remainder n 2) 0))
(define (fast-expt b n)
  (display "step: ") (display n) (newline)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))
(fast-expt 2 20) ; 7 steps

(define (fast-expt-iter b n)
  (define (fast-expt-step b n a)
    (display "step: ") (display b) (display ", ") (display n) (display ", ") (display a) (newline)
    (cond ((= n 0) a)
          ((even? n) (fast-expt-step (square b) (/ n 2) a))
          (else (fast-expt-step b (- n 1) (* a b)))))
  (fast-expt-step b n 1))
; a*b^n
(fast-expt-iter 2 20) ; 7 steps!
