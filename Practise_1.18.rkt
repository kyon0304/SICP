#lang racket
(define (double x) (+ x x))
(define (halve x) (/ x 2))
(define (* a b)
  (*-iter a b 0))
(define (*-iter a b sum)
  (cond ((= b 0) 0)
        ((= b 1) (+ a sum))
        ((even? b) (*-iter (double a) (halve b) sum))
        (else (*-iter (double a) (halve (- b 1)) (+ sum a)))))

(* 3 25)