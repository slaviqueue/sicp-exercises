#lang racket

; Exercise 2.31:
; Abstract your answer to Exercise 2.30 to produce a procedure tree-map with the
; property that square-tree could be defined as

; (define (square-tree tree) (tree-map square tree))

(define (tree-map fn item)
  (if (not (list? item))
      (fn item)
      (map (lambda (it) (tree-map fn it))
           item)))

(define (add-one-to-all tree)
  (tree-map (lambda (x) (+ x 1))
            tree))

(println (add-one-to-all
          '(1 2 (((1 2 4) 2) (4)))))
; '(2 3 (((2 3 5) 3) (5)))