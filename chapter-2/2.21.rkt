#lang racket

; Exercise 2.21:

; The procedure square-list takes a list of numbers as argument and returns a list of the squares of
; those numbers.

; (square-list (list 1 2 3 4))
; (1 4 9 16)

; Here are two different definitions of square-list. Com- plete both of them by filling in the missing
; expressions:

; (define (square-list items) (if (null? items)
;                                 null
;                                 (cons ⟨??⟩ ⟨??⟩)))

(define (square-list items)
  (if (null? items)
      null
      (cons (* (car items) (car items))
            (square-list (cdr items)))))

(square-list (list 1 2 3 4 5)) ; '(1 4 9 16 25)

; (define (square-list-map items)
;   (map ⟨??⟩ ⟨??⟩))

(define (square-list-map items)
  (map (lambda (n) (* n n)) items))

(square-list-map (list 1 2 3 4 5)) ; '(1 4 9 16 25)
