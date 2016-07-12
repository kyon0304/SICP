#lang racket
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))

(define (identity a) a)
(sum identity 1 (lambda (x) (+ x 1)) 10)