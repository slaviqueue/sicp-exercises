#lang racket

; Exercise 1.8:

; Newton’s method for cube roots is based on the fact that if y is an approximation to
; the cube root of x, then a better approximation is given by the value:
; ((x / y)^2 + 2 * y) / 3

; Use this formula to implement a cube-root procedure analogous to the square-root procedure. (In
; Section 1.3.4 we will see how to implement Newton’s method in general as an abstraction of these
; square-root and cube-root procedures.)

(define delta 0.001)

(define (square x) (* x x))

(define (cube x) (* x x x))

(define (good-enough? approximation value)
  (< (abs (- (cube approximation) value)) delta))

(define (next-approximation y x)
  (/
   (+
    (/ x (* y y))
    (* 2 y))
   3))

(define (iter approximation value)
  (if (good-enough? approximation value)
      approximation
      (iter
       (next-approximation approximation value)
       value)))

(define (cube-root value)
  (iter 1 value))

(exact->inexact (cube-root 27)) ; 3.0000005410641766
