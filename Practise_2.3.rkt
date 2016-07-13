#lang racket
(require "Practise_2.2.rkt")

(define (make-rect top right)
  (cons top right))

(define (top rect)
  (car rect))

(define (right rect)
  (cdr rect))

(define (width rect)
  (- (x-point (end-segment (top rect)))
     (x-point (start-segment (top rect)))))

(define (height rect)
  (- (y-point (start-segment (right rect)))
     (y-point (end-segment (right rect)))))

(define (area width height)
  (lambda (rect)
    (* (width rect)
       (height rect))))

(define (circum width height)
  (lambda (rect)
    (* 2
     (+ (width rect)
        (height rect)))))

;==========================================================

(define (make-rect2 top-left-corner right-bottom-corner)
  (cons top-left-corner right-bottom-corner))

(define (start-point rect)
  (car rect))

(define (end-point rect)
  (cdr rect))

(define (width2 rect)
  (- (x-point (end-point rect))
     (x-point (start-point rect))))

(define (height2 rect)
  (- (y-point (start-point rect))
     (y-point (end-point rect))))

;==========================================================

(let ((top-line (make-segment (make-point 1 3)
                               (make-point 5 3)))
      (right-line (make-segment (make-point 5 3)
                                 (make-point 5 1)))
      (top-left (make-point 1 3))
      (right-bottom (make-point 5 1)))
  (let ((rect1 (make-rect top-line right-line))
        (rect2 (make-rect2 top-left right-bottom)))
    (display ((area width height) rect1))
    (newline)
    (display ((area width2 height2) rect2))
    (newline)
    (display ((circum width height) rect1))
    (newline)
    (display ((circum width2 height2) rect2))))