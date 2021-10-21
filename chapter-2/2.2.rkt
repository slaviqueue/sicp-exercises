#lang racket

; Exercise 2.2:
; Consider the problem of representing line segments in a plane. Each segment is
; represented as a pair of points: a starting point and an ending point. Define a constructor
; make-segment and selectors start-segment and end-segment that define the representation of segments
; in terms of points. Furthermore, a point can be represented as a pair of numbers: the x coordinate
; and the y coordi- nate. Accordingly, specify a constructor make-point and selectors x-point and
; y-point that define this representa- tion. Finally, using your selectors and constructors, define a
; procedure midpoint-segment that takes a line segment as argument and returns its midpoint (the point
; whose coor- dinates are the average of the coordinates of the endpoints). To try your procedures,
; you’ll need a way to print points:

(define (print-point p) (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))



; Segments

(define (make-segment start end)
  (cons start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (midpoint-segment segment)
  (make-segment
   (/ (+ (x-point (start-segment segment)) (x-point (end-segment segment))) 2)
   (/ (+ (y-point (start-segment segment)) (y-point (end-segment segment))) 2)))




; Points

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))



; Test

(define test-segment
  (make-segment
   (make-point 3 1)
   (make-point 3 -4)))

(print-point (midpoint-segment test-segment)) ; (3,-3/2)
