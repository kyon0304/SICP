#lang racket
(require "Practise_1.37.rkt")

(define (tan-cf x k)
  (cont-frac (lambda (i)
               (if (= i 1)
                   x
                   (- (sqr x))))
             (lambda (i) (- 1 (* 2 i)))
             k))
               
;(tan-cf (/ 3.15 2) 2000)