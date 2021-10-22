#lang racket

; Exercise 2.10:

; Ben Bitdiddle, an expert systems programmer, looks over Alyssa’s shoulder and
; comments that it is not clear what it means to divide by an interval that spans zero. Modify
; Alyssa’s code to check for this condition and to signal an error if it occurs.

(define (make-interval a b)
  (if (not (equal? (< a 0) (< b 0)))
      (raise "interval spans zero")
      (cons a b)))

; Test

(define correct-interval (make-interval 1 3))
(define another-correct-interval (make-interval -3 -1))
(define incorrect-interval (make-interval -3 1)) ; raises error
