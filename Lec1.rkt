#lang racket
(define (add2 x) (+ 2 x))
(add2 3)

(define (abs x)
  (if (< x 0)
      (- x)
      x))
(abs -3)

(define (sqrt x)
  (define tolerance 0.000001)
  (define (sqr x) (* x x))
  (define (avg x y) (/ (+ x y) 2))
  (define (good-enough? guess) (< (abs (- (sqr guess) x)) tolerance))
  (define (try guess) (if (good-enough? guess) guess
                  (try (avg guess (/ x guess)))))
  (try 1))
(exact->inexact (sqrt 9))

(define (sos x y)
  (+ (sqr x) (sqr y)))
(define (sqr x)
  (* x x))
(sos 3 4)

(define (fib n)
  (if (< n 2)
      n
      (+ (fib (- n 1))
         (fib (- n 2)))))
(fib 10)

(define (hanoi n)
  (if (= n 1)
      1
      (+ (* (hanoi (- n 1)) 2) 1)))
(hanoi 5)