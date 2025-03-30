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

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square n)
  (* n n))

(define (search-for-primes count n)
  (define (report-prime n elapsed-time)
    (newline)
    (display "|")
    (display n)
    (display "|")
    (display elapsed-time)
    (display "|")
    (search-for-primes (- count 1) (+ n 2)))
  (define (timed-search-for-primes n start-time)
    (cond ((even? n) (timed-search-for-primes (+ 1 n) start-time))
          ((prime? n) (report-prime n (- (runtime) start-time)))
          (else (timed-search-for-primes (+ 2 n) start-time))))
  (if (> count 0)
      (timed-search-for-primes n (runtime))
      (newline)))

(search-for-primes 3 1000000)