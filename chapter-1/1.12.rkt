#lang racket

; Exercise 1.12

; Write a procedure that computes elements of Pascal’s triangle by means of a recursive process.

(define (pascal n)
  (if (= n 0)
      1
      (+ (pascal (- n 1)) (pascal (- n 1)))))

(pascal 20) ; 1048576
