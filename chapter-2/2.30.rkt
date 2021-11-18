#lang racket

; Exercise 2.30:
; Define a procedure square-tree analogous to the square-list procedure of Exercise
; 2.21.

; Define square-tree both directly (i.e., without using any higher-order procedures) and also by using
; map and recursion.

(define (square n) (* n n))

(define (square-tree-reg item)
  (if (null? item)
      '()
      (if (not (list? item))
          (square item)
          (append (list (square-tree-reg (car item)))
                  (square-tree-reg (cdr item))))))


(define (square-tree-map item)
  (if (not (list? item))
      (square item)
      (map square-tree-map item)))

(square-tree-reg (list 1
                       (list 2 (list 3 4) 5)
                       (list 6 7)))
; (1 (4 (9 16) 25) (36 49))

(square-tree-map (list 1
                       (list 2 (list 3 4) 5)
                       (list 6 7)))
; (1 (4 (9 16) 25) (36 49))
