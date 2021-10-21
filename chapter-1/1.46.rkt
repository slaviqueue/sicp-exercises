#lang racket

; Exercise 1.46

; Several of the numerical methods described in this chapter are instances of an extremely general
; computational strategy known as iterative improvement. Iterative improvement says that, to compute
; something, we start with an initial guess for the answer, test if the guess is good enough, and
; otherwise improve the guess and continue the process using the improved guess as the new guess.
; Write a procedure iterative-improve that takes two procedures as arguments: a method for telling
; whether a guess is good enough and a method for improving a guess. iterativeimprove should return as
; its value a procedure that takes a guess as argument and keeps improving the guess until it is good
; enough. Rewrite the sqrt procedure of Section 1.1.7 and the fixed-point procedure of Section 1.3.3
; in terms of iterative-improve.

(define (iterative-improve good-enough? improve)
  (define (iter x)
    (if (good-enough? x)
        x
        (iter (improve x))))
  iter)

; Test with sqrt
(define (average x y)
  (/ (+ x y) 2))

(define (sqrt n)
  ((iterative-improve
    (lambda (guess) (< (abs (- n (* guess guess))) 0.001))
    (lambda (guess) (average guess (/ n guess))))
   n))

(print (exact->inexact (sqrt 4))) ; 2.0000000929222947

; Test with fixed-point
(define fixed-point-tolerance 0.0001)

(define (fixed-point f first-guess)
  (define (good-enough? guess)
    (<
     (abs (- guess (f guess)))
     fixed-point-tolerance))

  ((iterative-improve good-enough? f)
   first-guess))

(print (exact->inexact (fixed-point cos 1.0))) ; 0.7391301765296711
