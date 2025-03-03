(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))
(A 1 10)
(A 0 (A 1 9))
(A 0 (A 0 (A 1 8)))
...
(A 0 (A 0 ... (A 0 (A 1 1))))
(A 0 (A 0 ... (A 0 2)))
(A 0 (A 0 ... 4))
; 2^10 should be the answer
; 1024 yes

(A 2 4)
(A 1 (A 2 3))
(A 1 (A 1 (A 2 2)))
(A 1 (A 1 (A 1 (A 2 1))))
(A 1 (A 1 (A 1 2))))
(A 1 (A 1 (A 0 (A 1 1))))
(A 1 (A 1 (A 0 2)))
(A 1 (A 1 4))
(A 1 (A 0 (A 1 3))); I dont understand where it goes. eventually it will go to 2. my guess answer is 2^4. 65536 wtf is this ah 2^2^4. wow
(A 1 (A 0 (A 0 (A 1 2))))
(A 1 (A 0 (A 0 (A 0 (A 1 1)))))
(A 1 (A 0 (A 0 (A 0 2))))
(A 1 (A 0 (A 0 4)))
(A 1 (A 0 8))
(A 1 16)
(A 0 (A 1 15))
(A 0 (A 0 (A 1 14)))
...
(A 0 (A 0 ... (A 0 (A 1 1)))))
(A 0 (A 0 ... (A 0 2)))
; 2^16, like in first example



(A 3 3) ; so here answer should be 2^3^3. 65536. no it's still 2^2^4
(A 2 (A 3 2))
(A 2 (A 2 (A 3 1)))
(A 2 (A 2 2))
(A 2 (A 1 (A 2 1)))
(A 2 (A 1 2))
(A 2 (A 0 (A 1 1)))
(A 2 (A 0 2))
(A 2 4) ; still good. so here it's the similar with 2
65536

(define (f n)
  (A 0 n))
(A 0 n)
(* 2 n)
; f(n) = 2n

(define (g n)
  (A 1 n))
(A 1 n)
(define (A 1 n)
  (cond ((= n 0) 0)
        ((= 1 0) (* 2 n))
        ((= n 1) 2)
        (else (A 0 (A 1 (- n 1))))))
(define (A 1 n)
  (cond ((= n 0) 0)
        ((= n 1) 2)
        (else (* 2 (A 1 (- n 1))))))
; g(n) = 2 * g(n-1)
; g(n) = 2 * 2 * g(n-2)
; g(n) = 2 * 2 * 2 * g(n-3)
; for n=4 it would be 2 * 2 * 2 * 2 = 2^4
; g(n) = 2^n

(define (h n)
  (A 2 n))
(A 2 n)
(define (A 2 n)
  (cond ((= n 0) 0)
        ((= 2 0) (* 2 y)) ; always false
        ((= n 1) 2)
        (else (A 1 (A 2 (- n 1))))))
(define (A 2 n)
  (cond ((= n 0) 0)
        ((= n 1) 2)
        (else (A 1 (A 2 (- n 1))))))
; (A 1 x) is 2^x
; h(n) = 2^(h(n-1))
; h(n) = 2^(2^(h(n-2)))
; h(n) = 2^(2^(2^(...^2)))
; h(1) = 2
; h(2) = 4
; h(3) = 16
; h(4) = 65536
; h(5) = 2^65536