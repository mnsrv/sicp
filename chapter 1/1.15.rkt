(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle step)
  (display step) (display ": ") (display angle) (newline)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0) (+ step 1)))))

(sine 12.15 1)

; a. how many times is the procedure p applied when (sine 12.15) is evaluated?
(sine 12.15) ; 12.15
(p (sine (/ 12.15 3.0))) ; 4.05
(p (p (sine (/ (/ 12.15 3.0) 3.0)))) ; 1.35
(p (p (p (sine (/ (/ (/ 12.15 3.0) 3.0) 3.0))))) ; 0.45
(p (p (p (p (sine (/ (/ (/ (/ 12.15 3.0) 3.0) 3.0) 3.0)))))) ; 0.15
(p (p (p (p (p (sine (/ (/ (/ (/ (/ 12.15 3.0) 3.0) 3.0) 3.0) 3.0))))))) ; 0.05
; 5 times.
; x / 3^n < 0.1
; x < 0.1 * 3^n
; n > log3(x) - log3(0.1)
; n = (log(x) - log(0.1)) / log(3)
; n = (log(x) + 1) / 0.477
; n = (log(12.15) + 1) / 0.477
; n = (1.085 + 1) / 0.477
; n = 4.37 -> 5

; b. order of growth in space?
; log(a)
; order of growth in number of steps?
; log(a)