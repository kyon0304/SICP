#lang racket
(define (gcd x y)
  (if (= y 0)
      x
      (gcd y (remainder x y))))

;(gcd 28 16)

(provide gcd)