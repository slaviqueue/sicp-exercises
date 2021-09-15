; Exercise 1.3.
; Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.

#lang racket/base

(define (sum-of-squares a b)
  (+ (* a a) (* b b)))

(define (do-stuff a b c)
  (if (< a b) 
    (if (< c a) (sum-of-squares a b) (sum-of-squares b c))
    (if (< c b) (sum-of-squares a b) (sum-of-squares a c))))

(do-stuff 1 2 3)
