#lang racket
(require "Practise_1.42.rkt")

(define (repeated f n)
  (cond ((= n 1) (lambda (x) (f x)))
        (else (compose f (repeated f (- n 1))))))

;((repeated sqr 2) 5)

(provide repeated)