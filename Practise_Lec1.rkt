;#lang racket
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))

(define (sum-big a b c)
  (if (> a b)
      (+ a
         (if (> b c) b c))
      (+ b
         (if (> a c) a c))))
(sum-big 8 6 7)

;(define (p) (p))
;(define (test x y)
;  (if (= x 0)
;      0
;      y))
;(test 0 (p))

(define (sqrt x)
  (define (new-if predicate then-clause else-clause)
    (cond (predicate then-clause)
          (#t else-clause)))
  (define delta 0.01)
  (define (abs a) (if (< a 0) (- a) a))
  (define (good-enuf? old new) (< (/ (abs (- old new)) new) delta))
  (define (avg a b) (/ (+ a b) 2))
  (define (improve guess)
    (avg guess (/ x guess)))
  (define (try guess)
    (let ((new-guess (improve guess)))
    (if (good-enuf? guess new-guess)
        new-guess
        (try new-guess))))
  (try 1))
;  (define average-damp
;    (lambda (f)
;      (lambda (guess)
;        (avg guess (f guess)))))
;  (define (iter f guess)
;    (if (good-enuf? guess)
;        guess
;        (iter f (f guess))))    
;  (iter (average-damp (lambda (a) (/ x a))) 1))
(exact->inexact (sqrt 100000000))
