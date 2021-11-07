#lang racket

; Exercise 2.27:
; Modify your reverse procedure of Exercise 2.18 to produce a deep-reverse procedure
; that takes a list as argument and returns as its value the list with its elements reversed and
; with all sublists deep-reversed as well. For example,

(define (deep-reverse items)
  (if (not (list? items))
      items
      (if (null? (cdr items))
          (list (deep-reverse (car items)))
          (append (deep-reverse (cdr items))
                  (list (deep-reverse (car items)))))))

(define x (list (list 1 2) (list 3 4)))
(deep-reverse x) ; ((4 3) (2 1))
