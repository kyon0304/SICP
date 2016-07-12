#lang racket
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (if (= (remainder n test-divisor) 0)
      test-divisor
      (find-divisor n (next test-divisor))))
(define (next d)
  (if (= d 2)
      3
      (+ d 2)))
;(smallest-divisor 199)
(provide smallest-divisor)