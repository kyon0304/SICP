#lang racket
(require "util.rkt")

(define tolerance 0.000001)

(define (fixed-point f guess)
  (define (close-enough? guess)
    (< (abs (- guess (f guess))) tolerance))
  (if (close-enough? guess)
      guess
      (fixed-point f (avg guess (f guess)))))

(define golden (exact->inexact (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1)))
(provide golden)
  
