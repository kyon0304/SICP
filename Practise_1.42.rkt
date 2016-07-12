#lang racket
(require "util.rkt")

(define (compose f g)
  (lambda (x)
          (f (g x))))

(provide compose)
;((compose sqr inc) 6)