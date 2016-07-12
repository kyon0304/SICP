#lang racket
(require "util.rkt")

(define (product term a next b)
  (cond ((> a b) 1)
        ;((= a b) (term a))
        (else (* (product term (next a) next b) (term a)))))

(product identity 3 inc 3)

(define (factorial n)
  (product identity 1 inc n))

;(factorial 3)

(define (PI times)
  (if (even? times)
      (let ((count-dominator (/ times 2)))
        (let ((count-numerator (/ (- times 2) 2)))
          (* 4
             (/ (* 2
                   (sqr (product (lambda (x) (* 2 (+ x 1))) 1 inc count-numerator))
                   (* 2 (+ count-numerator 2)))
                (sqr (product (lambda (x) (+ (* x 2) 1)) 1 inc count-dominator))))))
      (let ((count-dominator (/ (- times 1) 2)))
        (let ((count-numerator (/ (- times 1) 2)))
          (* 4
             (/ (* 2
                   (sqr (product (lambda (x) (* 2 (+ x 1))) 1 inc count-numerator)))
                (* (sqr (product (lambda (x) (+ (* x 2) 1)) 1 inc count-dominator))
                   (+ (* 2 (+ count-dominator 1)) 1))))))))

;(exact->inexact (PI 418))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))
;(product-iter (lambda (x) x) 1 inc 4)