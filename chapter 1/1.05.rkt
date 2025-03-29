#lang racket
(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))
; (test 0 (p))
; scheme is applicative-order language
; here it will return infinite loop
; in normal-order language test will return 0