#lang racket
(define (pascal-triangle-element row col)
  (if (or (= row col) (= col 0))
      1
      (+ (pascal-triangle-element (- row 1) (- col 1))
         (pascal-triangle-element (- row 1) col))))

(pascal-triangle-element 6 0)