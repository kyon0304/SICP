#lang racket
(require "util.rkt")

(define (double f)
  (lambda (x) (f (f x))))

((double (double (double (double inc)))) 5)

(((double (double double)) inc) 5)