#lang racket
(define (fixed-point f start)
  (define tolerance 0.00001)
  (define (good-enuf? x y) (< (abs (- x y)) tolerance))
  (define (iter old new)
    (if (good-enuf? old new)
        new
        (iter new (f new))))
  (iter start (f start)))
(define (sqrt x)
  (define (avg a b) (/ (+ a b) 2))
  (define average-damp
    (lambda (f)
      (lambda (x) (avg x (f x)))))
  (fixed-point
   (average-damp
    (lambda (y) (/ x y)))
   1))
(exact->inexact (sqrt 2))

(define (newton-guess f guess)
  (define dx 0.0000000001)
  (define deriv
    (lambda (f)
      (lambda (x)
        (/ (- (f (+ x dx)) (f x))
           dx))))
  (define df (deriv f))
  (fixed-point
   (lambda (x)
     (- x (/ (f x) (df x))))
   guess))
(define (sqr-root x)
  (define (sqr a) (* a a))
  (newton-guess
   (lambda (y) (- x (sqr y))) 1))
(sqr-root 4)