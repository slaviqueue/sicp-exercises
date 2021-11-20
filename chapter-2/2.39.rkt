#lang racket

; Exercise 2.39

(require rackunit)

(define (reverse-foldr sequence)
  (foldr (lambda (x y) (append y (list x))) null sequence))

(check-equal? (reverse-foldr '(1 2 3)) '(3 2 1))

(define (reverse-foldl sequence)
  (foldl (lambda (x y) (append (list x) y)) null sequence))

(check-equal? (reverse-foldl '(1 2 3)) '(3 2 1))
