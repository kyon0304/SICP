#lang racket
(require "Chapter_1.2.6_fastprime.rkt")
(define (check-carmichael n)
  (define (try-it n a)
    (cond ((= a n)
           (display 'cheated)
           (newline))
          ((= (expmod a n n) a)
           (try-it n (+ a 1)))
          (else
           (display 'exposed))))
  (try-it n 2))

(check-carmichael 561)
(check-carmichael 1105)
(check-carmichael 1729)
(check-carmichael 2465)
(check-carmichael 2821)
(check-carmichael 6601)
(check-carmichael 100)