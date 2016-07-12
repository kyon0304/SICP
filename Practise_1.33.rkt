#lang racket
(require "Chapter_1.2.6_fastprime.rkt")
(require "util.rkt")
(require "Chapter_1.2.5_gcd.rkt")

(define (prime? n) (fast-prime? n 10))

(define (filtered-accumulate combiner null-value term a next b filter)
  (define (iter a result filter)
    (cond ((> a b) result)
          ((filter (term a))
           (iter (next a)
                 (combiner result
                           (term a))
                 filter))
          (else (iter (next a) result filter))))
  (iter a null-value filter))

(define (sum-prime a b)
  (filtered-accumulate + 0 identity a inc b prime?))

(sum-prime 1 100)

(define (coprime? x n)
  (= (gcd x n) 1))
  
(define (product-coprime n)
  (filtered-accumulate * 1 identity 2 inc n (lambda (x) (coprime? x n))))

(product-coprime 10)