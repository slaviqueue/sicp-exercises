#lang racket

; Exercise 2.35: Redefine count-leaves from Section 2.2.2 as an accumulation:

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate + 0 (map (lambda (it)
                         (cond [(not (list? it)) 1]
                               [(not (list? (car it))) (+ 1 (count-leaves (cdr it)))]
                               [else (+ (count-leaves (car it)) (count-leaves (cdr it)))]))
                       t)))

(println (count-leaves '(1 (1) 4 (2 4 (5 6 ((5)))))))
