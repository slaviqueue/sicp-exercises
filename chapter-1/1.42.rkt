#lang racket

; Exercise 1.42

; Let f and g be two one-argument functions. The composition f after g is defined to be the function x
; 7→ f(g(x)). Define a procedure compose that implements composition.

(define (compose f g)
  (lambda (x) (f (g x))))

; Test:
(define (square n) (* n n))
(define (inc n) (+ n 1))

((compose square inc) 6) ; 49
