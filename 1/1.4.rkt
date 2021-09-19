#lang racket/base

; Exercise 1.4.
; Observe that our model of evaluation allows for combinations whose operators are compound expressions. Use this observation to describe the behavior of the following procedure:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; This works because "+" and "-" are both regular functions, which are expressions.
; In example above we are choosing which expression to apply to "a" and "b" operands.
