#lang racket

; Exercise 2.28:

; Write a procedure fringe that takes as argument a tree (represented as a list) and returns a list
; whose elements are all the leaves of the tree arranged in left-to-right order.

(define (fringe node)
  (cond
    [(null? node) (list)]
    [(not (list? node)) (list node)]
    [else (append (fringe (car node))
                  (fringe (cdr node)))]))

(define x '((1 2) (3 4)))
(print (fringe x)) ; (1 2 3 4)
(print (fringe (list x x))) ; (1 2 3 4 1 2 3 4)
