#lang racket

; Exercise 2.4:

; Here is an alternative procedural representation of pairs. For this representation,
; verify that (car (cons x y)) yields x for any objects x and y.

(define (cons x y) (lambda (m) (m x y)))
(define (car z) (z (lambda (p q) p)))

; What is the corresponding definition of cdr? (Hint: To verify that this works, make use of the
; substitution model of Section 1.1.5.)

; Solution

(define (cdr z) (z (lambda (p q) q)))

; Test

(define some-test-pair (cons 1 2))
(print (car some-test-pair)) ; 1
(print (cdr some-test-pair)) ; 2

; Verification

;  (cdr (cons 1 2))
;  ((cons 1 2) (lambda (p q) q))
;  ((lambda (m) (m 1 2)) (lambda (p q) q))
;  ((lambda (p q) q) 1 2)