#lang racket

(define zero
  (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one
  (lambda (f) (lambda (x) (f x))))

(define two
  (lambda (f) (lambda (x) (f (f x)))))

(define (add a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))

((one sqr) 2)

(((add-1 one) sqr) 2)

((two sqr) 2)

(((add-1 two) sqr) 2)

(((add one two) sqr) 2)