#lang racket
(require "util.rkt")

(define tolerance 0.001)

(define (average-damp f)
  (lambda (x)
    (avg x (f x))))

(define (iterative-improve good-enough? improve-it)
  (define (try-it guess)
    (if (good-enough? guess)
        guess
        (try-it (improve-it guess))))
  (lambda (first-guess)
    (try-it first-guess)))

(define (fixed-point f first-guess)
  ((iterative-improve (lambda (x) (< (abs (- x (f x))) tolerance))
                     (average-damp f)) first-guess))

(define (sqrt x)
  (fixed-point (lambda (r) (/ x r)) 1.0))

(sqrt 64)