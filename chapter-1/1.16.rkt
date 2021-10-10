#lang racket

; Exercise 1.16
; Design a procedure that evolves an iterative
; exponentiation process that uses successive squaring
; and uses a logarithmic number of steps, as does fast-expt.

(define (exp-iter b n) (iter b n b))

(define (even? n) (= (remainder n 2) 0))

(define (square n) (* n n))

(define (iter b n acc)
  (if (= n 1)
      acc
      (if (even? n)
          (iter
           b
           (/ n 2)
           (square acc))
          (iter
           b
           (- n 1)
           (* acc b)))))
