#lang racket
(require "util.rkt")
(require "Practise_1.36.rkt")

(define dx 0.000001)

(define (derive f x)
  (/ (- (f (+ x dx) ) (f x)) dx))

(define (newton-transform f)
  (lambda (x)
    (- x
       (/ (f x)
          (derive f x)))))

(define (newton-method f guess)
  (fixed-point (newton-transform f) guess))

(define (cubic a b c)
  (lambda (x) (+ (cube x)
                 (* a (sqr x))
                 (* b x)
                 c)))

(newton-method (cubic 1 1 1) 2)

