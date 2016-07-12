#lang racket
(define (expt b n)
  (expt-iter b n 1))
(define (sqr x) (* x x))
(define (expt-iter b n product)
  (cond ((= n 0) product)
        ((even? n) (expt-iter (sqr b) (/ n 2) product))
        (else (expt-iter (sqr b) (/ (- n 1) 2) (* b product)))))

(expt 3 4)