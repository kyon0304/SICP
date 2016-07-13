#lang racket

(define (nth-sqr-abs base exp)
  (if (= exp 0)
      1
      (* base (nth-sqr base (- exp 1)))))

(define (nth-sqr base exp)
  (if (< exp 0)
      (/ 1 (nth-sqr-abs base (- exp)))
      (nth-sqr-abs base exp)))

(define (cons a b)
  (* (nth-sqr 2 a)
     (nth-sqr 3 b)))

(define (nth-root-abs x base exp)
  (if (not (= (remainder x base) 0))
      exp
      (nth-root-abs (/ x base) base (+ exp 1))))

(define (nth-root x base)
  (if (integer? x)
      (nth-root-abs x base 0)
      (bitwise-ior (nth-root-abs (numerator x) base 0)
                   (- (nth-root-abs (denominator x) base 0)))))

(define (car x)
  (nth-root x 2))

(define (cdr x)
  (nth-root x 3))

(car (cons -3 1))
(cdr (cons -3 1))
(cdr (cons -3 -2))