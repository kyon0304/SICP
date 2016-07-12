#lang racket
;(require "Practise_1.36.rkt")
(require "util.rkt")
(require "Practise_1.43.rkt")

(define tolerance 0.0001)

(define (average-damp f)
  (lambda (x) (avg x (f x))))

(define (log2 x)
  (define (try-it exp)
    ;(display exp)
    ;(newline)
    (if (> (nth-sqr 2 exp) x)
        exp
        (try-it (+ exp 1))))
  (try-it 0))
      
(define (nth-average-damp n)
  (repeated average-damp n))

(define (fixed-point f first-guess n)
  (define (try-guess old new)
    ;(display old)
    ;(newline)
    (if (close-enough? old new tolerance)
        new
        (try-guess new
                   (((nth-average-damp (- (log2 n) 1)) f) new))))
  (try-guess first-guess (f first-guess)))

(define (nth-sqr base exp)
  (if (= exp 0)
      1
      (* base (nth-sqr base (- exp 1)))))

(define (nth-root x n)
  (fixed-point (lambda (r) (/ x (nth-sqr r (- n 1))))
               1.0
               n))

(nth-root 65536 32)