#lang racket
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (sqr (expmod base (/ exp 2) m)) m))
        (else
         (remainder (* base (sqr (expmod base (/ (- exp 1) 2) m))) m))))
;(expmod 4 7 7)

(define (fast-expt base exp)
  (cond ((= exp 0) 1)
        ((even? exp) (sqr (fast-expt base (/ exp 2))))
        (else (* base (sqr (fast-expt base (/ (- exp 1) 2)))))))

(define (expmod2 base exp m)
  (remainder (fast-expt base exp) m))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (if (< n 2)
      false
      (try-it (+ 1 (random (- n 1))))))
;(fermat-test 0)

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))
;(fast-prime? 561 560)

(provide fast-prime?)
(provide expmod)