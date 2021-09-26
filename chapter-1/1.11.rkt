#lang racket

(define (f-recursive n)
  (if (< n 3)
    n
    (+
      (f-recursive (- n 1))
      (* 2 (f-recursive (- n 2)))
      (* 3 (f-recursive (- n 3))))))

(define (f-iterative n)
  (define (inc x) (+ x 1))

  (define (iter i a b c)
    (if (> i n)
      c
      (iter
        (inc i)
        b
        c
        (+ c (* b 2) (* a 3)))))

  (if (< n 3) n (iter 3 0 1 2)))

(f-recursive 3)  ; 3
(f-recursive 10) ; 1892

(f-iterative 3)  ; 3
(f-iterative 10) ; 1892

