#lang racket
(require "util.rkt")
(require "Practise_1.35.rkt")

(define (cont-frac-recursive n d start end)
  (if (= start end)
      (/ (n end) (d end))
      (/ (n start) (+ (d start) (cont-frac-recursive n d (+ start 1) end)))))

(define (cont-frac n d k) (cont-frac-recursive n d 1 k))

(define tolerance 0.00001)

(define (golden-finder first-guess)
  (define (try-guess guess)
    (let (( x (/ 1
                 (cont-frac (lambda (i) 1.0)
                            (lambda (i) 1.0)
                            guess))))
      (if (close-enough? x golden tolerance)
          guess
          (try-guess (+ guess 1)))))
  (try-guess first-guess))

;(golden-finder 1)

(define (cont-frac-iter n d start end)
  (define (iter i result)
    (if (= i end)
        result
        (iter (+ i 1) (/ (n i)
                         (+ (d i) result)))))
  (iter start (/ (n start) (d start))))

;(cont-frac-iter (lambda (i) 1.0)
;                (lambda (i) 1.0)
;                1
;                13)
;(cont-frac (lambda (i) 1.0)
;           (lambda (i) 1.0)
;           13)

(provide cont-frac)