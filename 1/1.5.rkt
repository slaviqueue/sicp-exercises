#lang racket/base

; Exercise 1.5: Ben Bitdiddle has invented a test to determine
; whether the interpreter he is faced with is using applicativeorder evaluation or normal-order evaluation. He defines the
; following two procedures:

(define (p) (p))

(define (test x y)
    (if (= x 0) 0 y))

; Then he evaluates the expression
(test 0 (p))

; What behavior will Ben observe with an interpreter that
; uses applicative-order evaluation? What behavior will he
; observe with an interpreter that uses normal-order evaluation? Explain your answer. (Assume that the evaluation
; rule for the special form if is the same whether the interpreter is using normal or applicative order: e predicate expression is evaluated first, and the result determines
; whether to evaluate the consequent or the alternative expression.)

; Answer:
; In case with applicative order, the program will go to the infinite loop,
; because it will try to evaluate the p each time an will never get the result.
; This will not happen with the normal order of evaluation.
