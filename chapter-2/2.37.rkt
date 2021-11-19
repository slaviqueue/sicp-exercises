#lang racket

; Exercise 2.37:

(require "./lib/accumulate.rkt")


(define (dot-product v w)
  (accumulate + 0 (map * v w)))


