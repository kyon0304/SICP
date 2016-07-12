#lang racket
(require "Chapter_1.2.6_fastprime.rkt")

(define (miller-rabin-expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (let ((remain (remainder (sqr (miller-rabin-expmod base (/ exp 2) m)) m)))
           (if (and (not (= exp (- m 1))) (not (= exp 1)) (= remain 1))
               0
               remain)))
        (else
         (let ((remain (remainder (* base (sqr (miller-rabin-expmod base (/ (- exp 1) 2) m))) m)))
           (if (and (not (= exp (- m 1))) (not (= exp 1)) (= remain 1))
               0
               remain)))))
 
(define (miller-rabin-test n)
  (define (try-it a)
    (= (miller-rabin-expmod a n n) a))
    ;(and (= (expmod a (- n 1) n) 1) (= (expmod a n n) a)))
  (try-it (+ 1 (random (- n 1)))))

(define (prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (prime? n (- times 1)))
        (else false)))
(prime? 561 10)
(fast-prime? 561 10)
