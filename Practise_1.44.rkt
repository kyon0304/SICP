#lang racket
(require "Practise_1.43.rkt")

(define dx 0.000001)

(define (avg a b c)
  (/ (+ a b c) 3))

(define (smooth f)
  (lambda (x)
    (avg (f (- x dx)) (f x) (f (+ x dx)))))

(define (n-smooth f n)
  (repeated smooth) f n)