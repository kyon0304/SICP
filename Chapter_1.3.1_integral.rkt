#lang racket

(define (cube x) (* x x x))

(define (sum term a b next)
  (if (> a b)
      0
      (+ (term a) (sum term (next a) b next))))

(define (integral f a b dx)
  (* (sum f (+ a (/ dx 2)) b (lambda (x) (+ x dx))) dx))

;(integral cube 0 1 0.001)

(provide sum)
(provide cube)