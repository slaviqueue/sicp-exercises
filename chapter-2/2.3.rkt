#lang racket

; Exercise 2.3:

; Implement a representation for rectangles in a plane. (Hint: You may want to make use
; of Exercise 2.2.) In terms of your constructors and selectors, create procedures that compute the
; perimeter and the area of a given rectangle. Now implement a different representation for rectan-
; gles. Can you design your system with suitable abstraction barriers, so that the same perimeter and
; area procedures will work using either representation?

; Points

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))



; Rectangle

(define (make-rectangle start-point end-point)
  (cons start-point end-point))

(define (rectangle-start rectangle)
  (car rectangle))

(define (rectangle-end rectangle)
  (cdr rectangle))

; rectangle-width and rectangle-height work
; with assumption that start is a bottom left corner
; and the end is top right corner of rectangle

(define (rectangle-width rectangle)
  (abs (-
        (x-point (rectangle-end rectangle))
        (x-point (rectangle-start rectangle)))))

(define (rectangle-height rectangle)
  (abs (-
        (y-point (rectangle-end rectangle))
        (y-point (rectangle-start rectangle)))))



; Solution

(define (rectangle-perimeter rectangle)
  (+
   (* 2 (rectangle-width rectangle))
   (* 2 (rectangle-height rectangle))))

(define (rectangle-area rectangle)
  (*
   (rectangle-width rectangle)
   (rectangle-height rectangle)))



; Test

(define test-rect
  (make-rectangle
   (make-point -1 -1)
   (make-point 2 3)))

(print (rectangle-area test-rect)) ; 12
(print (rectangle-perimeter test-rect)) ; 14

; ...
; ...
; ...
; ...