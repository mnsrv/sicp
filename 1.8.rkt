(define (improve y x)
  (/ (+ (/ x (* y y)) (* 2 y)) 3))

(define (new-good-enough? prev-guess guess)
  (< (abs (/ (- guess prev-guess) guess)) 0.00000000001))

(define (cube-root-iter guess x)
  (if (new-good-enough? guess (improve guess x))
    guess
    (cube-root-iter (improve guess x) x)))

(define (cube-root x)
  (cube-root-iter 1.0 x))