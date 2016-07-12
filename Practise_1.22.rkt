#lang racket
(require "Practise_1.21.rkt")
(require "Chapter_1.2.6_fastprime.rkt")

(define (prime? n) (fast-prime? n 10))

;(define (prime? n) (= (smallest-divisor n) n))

(define runtime current-milliseconds)
  
(define (timed-prime-test n)
  ;(newline)
  ;(display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (cond ((prime? n) (report-prime n (- (runtime) start-time)))
        (else false)))

(define (report-prime n elapsed-time)
  (display n)
  (display '***)
  (display elapsed-time)
  (newline))

(define (search-for-primes m n)
  (define (iter f start end count)
    (cond ((or (not (< start end)) (= count 0)) (display '===end) (newline))
          (else
           (if (not (f start))
               (iter f (+ start 2) end count)
               (iter f (+ start 2) end (- count 1))))))
  (if (and (even? m) (not (= m 2)))
      (iter timed-prime-test (+ m 1) n 3)
      (iter timed-prime-test m n 3)))

(search-for-primes 1000000000 2000000000)
(search-for-primes 100000 200000)
(search-for-primes 10000 20000)
(search-for-primes 1000 2000)

;(provide search-for-primes)