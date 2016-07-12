#lang racket
(define (double x) (+ x x))
(define (halve x) (/ x 2))
(define (* a b)
  (cond ((= b 0) 0)
        ((even? b) (double (* a (halve b))))
        (else (+ a (double (* a (halve (- b 1))))))))
      
(* 3 5)