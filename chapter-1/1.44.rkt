#lang racket

; Exercise 1.44

; The idea of smoothing a function is an important concept in signal processing.
; If f is a function and dx is some small number, then the smoothed version of f is
; the function whose value at a point x is the average of f (x − dx), f (x), and f (x+dx).
; Write a procedure smooth that takes as input a procedure that computes f and returns
; a procedure that computes the smoothed f. It is sometimes valuable to repeatedly
; smooth a function (that is, smooth the smoothed function, and so on) to obtain
; the n-fold smoothed function. Show how to generate the n-fold smoothed function
; of any given function using smooth and repeated from Exercise 1.43.

(define (repeated f times)
  (define (iter i value)
    (if (= i 0)
        value
        (iter (- i 1) (f value))))

  (lambda (x) (iter times x)))

(define dx 0.01)

(define (smooth f)
  (lambda (n)
    (/
     (+
      (f (- n dx))
      (f n)
      (f (+ n dx)))
     3)))

(define (smooth-times f times)
  ((repeated smooth times) f))

; Test;
(define smoothed-sin-1 (smooth-times sin 1))
(define smoothed-sin-2 (smooth-times sin 2))
(define smoothed-sin-10 (smooth-times sin 10))

(print (smoothed-sin-1 1))
(print (smoothed-sin-2 1))
(print (smoothed-sin-10 1))