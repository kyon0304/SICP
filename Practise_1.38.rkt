#lang racket
(require "Practise_1.37.rkt")

(define (e k)
  (+ 2
     (cont-frac (lambda (i) 1.0)
                (lambda (i)
                  (if (= (remainder i 3) 2)
                      (* (+ (floor (/ i 3)) 1) 2)
                      1.0))
                k)))

(e 20)