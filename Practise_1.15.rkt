#lang racket
(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine x)
  (if (not (> (abs x) 0.1))
      x
      (p (sine (/ x 3)))))

(sine 1.57)