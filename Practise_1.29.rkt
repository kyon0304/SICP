#lang racket
(require "Chapter_1.3.1_integral.rkt")

;(define (sum term a b next)
  
(define (integral f a b n)
  (define h (/ (- b a) n))
  (* (+
      (sum
       (lambda (x) (* (f x) 4))
       (+ a h)
       (- b h)
       (lambda (x) (+ x (* 2 h))))
      (sum
       (lambda (x) (* (f x) 2))
       (+ a (* 2 h))
       (- b h)
       (lambda (x) (+ x (* 2 h))))
      (f a)
      (f b))
     (/ h 3)))

(exact->inexact (integral cube 0 1 2))