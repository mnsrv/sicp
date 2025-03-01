#lang racket
(define (sum-of-squares a b)
  (+ (* a a) (* b b)))

(define (solution a b c)
  (cond ((and (<= c a) (<= c b)) (sum-of-squares a b))
        ((and (<= b a) (<= b c)) (sum-of-squares a c))
        ((and (<= a b) (<= a c)) (sum-of-squares b c))))
