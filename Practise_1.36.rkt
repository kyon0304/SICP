#lang racket
(require "util.rkt")

(define tolerance 0.000001)

(define (close-enough? v1 v2)
  (< (abs (- v1 v2)) tolerance))

(define (fixed-point f first-guess)
  (define (try-guess guess)
    (let ((next (f guess)))
      (display (exact->inexact guess))
      (newline)
      (if (close-enough? guess next)
          next
          (try-guess (avg guess next)))))
  (try-guess first-guess))

;(exact->inexact (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1))
;(exact->inexact (fixed-point (lambda (x) (/ (log 1000) (log x))) 2))

;(display '*********************)
;(newline)

(define (fixed-point-noavg f first-guess)
  (define (try-guess guess)
    (let ((next (f guess)))
      (display (exact->inexact guess))
      (newline)
      (if (close-enough? guess next)
          next
          (try-guess next))))
  (try-guess first-guess))

;(exact->inexact (fixed-point-noavg (lambda (x) (/ (log 1000) (log x))) 2))

(define (average-damp f)
  (lambda (x) (avg x (f x))))

(define (fixed-point2 f first-guess)
  (define (try-guess old new)
    (if (close-enough? old new)
        new
        (try-guess new ((average-damp f) new))))
  (try-guess first-guess (f first-guess)))

;(exact->inexact (fixed-point2 (lambda (x) (+ 1 (/ 1 x))) 1))

(provide fixed-point)