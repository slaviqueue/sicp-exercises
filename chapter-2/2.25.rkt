#lang racket

; Exercise 2.25:
; Give combinations of cars and cdrs that will pick 7 from each of the following lists:

(define a (list (1 3 (list 5 7) 9)))
(car (cdr (car (cdr (car (cdr (cdr a))))))) ; 7

(define b
  (list (list 7)))
(car (car b)) ; 7

(define c (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 (list 7))))))))
(car (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr c)))))))))))))
