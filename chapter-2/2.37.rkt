#lang racket

; Exercise 2.37:

(require rackunit
         "./lib/accumulate.rkt"
         "./lib/accumulate-n.rkt")

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product row v))
       m))

(check-equal? (matrix-*-vector '((1 2 3) (4 5 6) (7 8 9))
                               '(2 1 3))
              '(13 31 49))

(define (transpose mat)
  (accumulate-n (lambda (cells new-matrix) (cons cells new-matrix))
                '()
                mat))

(check-equal? (transpose '((1 2 3) (4 5 6)))
              '((1 4) (2 5) (3 6)))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row) (matrix-*-vector cols row)) m)))

(check-equal? (matrix-*-matrix '((1 2 3) (4 5 6)) '((10 11) (20 21) (30 31)))
              '((140 146) (320 335)))
