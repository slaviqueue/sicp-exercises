#lang racket

(define (f n)
  (if (< n 3)
    n
    (+
      (f (- n 1))
      (* 2 (f (- n 2)))
      (* 3 (f (- n 3))))))

(f 3)  ; 3
(f 10) ; 1892