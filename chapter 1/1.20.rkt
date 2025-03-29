(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(gcd 206 40) ; 2
(remainder 206 40) ; 6
(remainder 40 6) ; 4
(remainder 6 4) ; 2
(remainder 4 2) ; 0
