(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square n)
  (* n n))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) 
                       start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (prime? n)
  (= n (smallest-divisor n)))


(define (find-divisor-old n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor-old n (+ test-divisor 1)))))
(define (smallest-divisor-old n)
  (find-divisor-old n 2))
(define (prime-old? n)
  (= n (smallest-divisor-old n)))
(define (start-prime-test-old n start-time)
  (if (prime-old? n)
      (report-prime (- (runtime) 
                       start-time))))
(define (timed-prime-test-old n)
  (newline)
  (display n)
  (start-prime-test-old n (runtime)))



(timed-prime-test-old 100000000057)
(timed-prime-test 100000000057)
