(define (square x) (* x x))
(define (average x y)
  (/ (+ x y) 2))
(define (improve guess x) (average guess (/ x guess)))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))
(define (sqrt x)
  (sqrt-iter 1.0 x))

; large numbers goes to infinite loop
; because of floating point numbers precision
; for larger numbers, there is limited numbers of bit for precision
; and the error will be always greater then our absolute tolerance
(sqrt 123456789012) ; 351364.1828815225
(sqrt 1234567890123) ; 1111111.1061109055
; (sqrt 9234567890124) ; does not finish

; for smaller numbers problem is different
; because tolerance is absolute for smaller numbers
; it will be too big
(sqrt 0.000123) ; 0.03254988507909497 should be 0.011090536506409418
(square (sqrt 0.000123)) ; 0.001059495018662289

(sqrt 0.00000000123) ; 0.031250013107186406 should be 0,1767767324
(square (sqrt 0.00000000123)) ; 0.000976563319199322

(define (square x) (* x x))
(define (improve guess x)
  (average guess (/ x guess)))
(define (average x y)
  (/ (+ x y) 2))

(define (new-good-enough? prev-guess guess)
  (< (abs (/ (- guess prev-guess) guess)) 0.00000000001))

(define (new-sqrt-iter guess x)
  (if (new-good-enough? guess (improve guess x))
    guess
    (new-sqrt-iter (improve guess x) x)))

(define (square-root x)
  (new-sqrt-iter 1.0 x))

(square-root 123456789012) ; 351364.1828815225
(square-root 1234567890123) ; 1111111.106111076
(square-root 9234567890124) ; 3038843.182877985
(square-root 0.000123) ; 0.011090536506409418
(square-root 0.00000000123) ; 3.507135583350038e-5
