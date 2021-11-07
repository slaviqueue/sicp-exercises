#lang racket

; Exercise 2.22:

; Louis Reasoner tries to rewrite the first square- list procedure of Exercise 2.21 so
; that it evolves an itera- tive process:

(define (square a) (* a a))

(define (square-list-1 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) (cons (square (car things))
                                 answer))))
  (iter items null))

; Unfortunately, defining square-list this way produces the answer list in the reverse order of the
; one desired. Why? Louis then tries to fix his bug by interchanging the arguments to cons:

(define (square-list-2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) (cons answer
                                 (square (car things))))))
  (iter items null))

; In square-list-2 list is being constructed incorrectly. First element of pair is a pair instead of
; the scalar value.

; Result of square-list-1 will be reversed because of recursive diving in
; "(cons (square (car things))"
