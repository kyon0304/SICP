#lang racket
(require "util.rkt")

(define (make-segment start end)
  (cons start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (midpoint-segment segment)
  (let ((start-point (start-segment segment))
        (end-point (end-segment segment)))
  (make-point (avg (x-point start-point)
                   (x-point end-point))
              (avg (y-point start-point)
                   (y-point end-point)))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define p1 (make-point 1 4))
(define p2 (make-point 3 8))
(define seg (make-segment p1 p2))
;(print-point (midpoint-segment seg))

(provide x-point)
(provide y-point)
(provide make-segment)
(provide make-point)
(provide start-segment)
(provide end-segment)