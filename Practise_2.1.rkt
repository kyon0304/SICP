#lang racket
(require "util.rkt")

(define (gcd a b)
  (if (= (remainder a b) 0)
      b
      (gcd b (remainder a b))))

(define (make-rat n d)
  (let ((g (gcd n d)))
    (if (> g 0)
        (cons (/ n g) (/ d g))
        (cons (- (abs (/ n g))) (abs (/ d g))))))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display '/)
  (display (denom x)))

(print-rat (make-rat 10 -15))