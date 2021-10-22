#lang racket

; Exercise 2.12: Define a constructor make-center-percent that takes a center and a percentage
; tolerance and produces the desired interval. You must also define a selector percent that produces
; the percentage tolerance for a given interval. The center selector is the same as the one shown
; above.

(define (make-center-percent center percent)
  (define offset (abs (* center percent)))

  (cons (+ center offset)
        (- center offset)))

(define (upper-bound interval)
  (car interval))

(define (lower-bound interval)
  (cdr interval))

(define (center interval)
  (/ (+ (upper-bound interval)
        (lower-bound interval))
     2))

(define (percent interval)
  (/ (- (center interval)
        (lower-bound interval))
     (center interval)))

; Test

(define test-interval (make-center-percent 5 .3))
(print (center test-interval)) ; 5
(print (percent test-interval)) ; .3
