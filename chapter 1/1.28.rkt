(define (square n)
  (* n n))

(define (remainder-check x m)
  (if (and
        (not (= 1 x))
        (not (= (- m 1) x))
        (= (remainder (square x) m) 1))
      0
      (remainder (square x) m)))

(define (expmod-check base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder-check (expmod-check base (/ exp 2) m) m))
        (else
         (remainder 
          (* base (expmod-check base (- exp 1) m))
          m))))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod-check a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(miller-rabin-test 561) ; #f Carmichael number
(miller-rabin-test 4)
(miller-rabin-test 1105)
(miller-rabin-test 1729)
(miller-rabin-test 2465)
(miller-rabin-test 2821)
(miller-rabin-test 6601)
(miller-rabin-test 19999)
(miller-rabin-test 1999)

(equal? (miller-rabin-test 3) #t)
(equal? (miller-rabin-test 4) #f)
(equal? (miller-rabin-test 561) #f)
(equal? (miller-rabin-test 1105) #f)
(equal? (miller-rabin-test 1729) #f)
(equal? (miller-rabin-test 2465) #f)
(equal? (miller-rabin-test 2821) #f)
(equal? (miller-rabin-test 6601) #f)
(equal? (miller-rabin-test 19999) #f)
(equal? (miller-rabin-test 1999) #t)
