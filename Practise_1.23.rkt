#lang racket
require("Practise_1.21.rkt")
require("Practise_1.22.rkt")

(define (prime? n) (= (smallest-divisor n) n))

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
;(smallest-divisor 4)