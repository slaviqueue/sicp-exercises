#lang racket

; Exercise 2.1:
; Define a better version of make-rat
; that handles both positive and negative arguments.
; make-rat should normalize the sign so that if the
; rational number is positive, both the numerator and
; denominator are positive, and if the rational number
; is negative, only the numerator is negative.

(define (normalize one-of-elements-negative? g n)
  (define reduced (reduce n g))

  (if one-of-elements-negative?
      (- (abs reduced))
      reduced))

(define (reduce n g)
  (/ n g))

(define (negative? a b)
  (or (< a 0) (< b 0)))

(define (make-rat n d)
  (define g (gcd n d))
  (define neg (negative? n d))

  (cons
   (normalize neg g n)
   (abs (normalize neg g d))))

; Test

(define one-third (make-rat 2 6))
(print (car one-third)) ; 1
(print (cdr one-third)) ; 3

(define minus-one-third (make-rat -2 6))
(print (car minus-one-third)) ; -1
(print (cdr minus-one-third)) ; 3
