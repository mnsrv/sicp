(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder 
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder 
          (* base (expmod base (- exp 1) m))
          m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (square n)
  (* n n))

(fermat-test 561) ; #t, but 561 = 3 * 11 * 17

(define (carmichael-test n)
  (define (try-it a)
    (cond [(= a 0) #t]
          [(= (expmod a n n) a) (try-it (- a 1))]
          [else #f]))
  (try-it (- n 1)))

(carmichael-test 4) ; #f

(carmichael-test 561) ; #t
(carmichael-test 1105) ; #t
(carmichael-test 1729) ; #t
(carmichael-test 2465) ; #t
(carmichael-test 2821) ; #t
(carmichael-test 6601) ; #t
