#lang racket

; Exercise 2.29:

; A binary mobile consists of two branches, a left branch and a right branch. Each branch is a rod of a
; certain length, from which hangs either a weight or another binary mobile. We can represent a
; binary mobile using compound data by constructing it from two branches (for example, using list):

(define (make-mobile left right)
  (list left right))

; A branch is constructed from a length (which must be a number) together with a structure, which may
; be either a number (representing a simple weight) or another mobile:

(define (make-branch length structure)
  (list length structure))

; a. Write the corresponding selectors left-branch and right-branch, which return the branches of a
; mobile, and branch-length and branch-structure, which return the components of a branch.

(define (left-branch mobile) (car mobile))

(define (right-branch mobile) (car (cdr mobile)))

(define (branch-length branch) (car branch))

(define (branch-structure branch) (car (cdr branch)))

; b. Using your selectors, define a procedure total-weight that returns the total weight of a mobile.

(define (mobile? valaue) (list? valaue))

(define (total-weight item)
  (if (mobile? item)
      (+ (total-weight (left-branch item))
         (total-weight (right-branch item)))
      item))

(define sample-mobile
  (make-mobile 1
               (make-mobile (make-mobile 2 4)
                            4)))

(println (total-weight sample-mobile)) ; 11

; c. A mobile is said to be balanced if the torque applied by its top left branch is equal to that
; applied by its top right branch (that is, if the length of the left rod multiplied by the weight
; hanging from that rod is equal to the corresponding product for the right side) and if each of the
; submobiles hanging off its branches is balanced. Design a predicate that tests whether a binary
; mobile is balanced.

(define (mobile-balanced? item)
  (define left (left-branch item))
  (define right (right-branch item))

  (if (not (eq? (mobile? left) (mobile? right)))
      #f
      (eq? (total-weight left)
           (total-weight right))))

(define unbalanced-mobile (make-mobile (make-mobile 1 2)
                                       (make-mobile (make-mobile 1 3)
                                                    4)))
(println (mobile-balanced? unbalanced-mobile)) ; #f

(define balanced-mobile-1 (make-mobile 1 1))
(println (mobile-balanced? balanced-mobile-1)) ; #t

(define balanced-mobile-2 (make-mobile (make-mobile 1 2) (make-mobile 0 3)))
(println (mobile-balanced? balanced-mobile-2)) ; #t

; d. Suppose we change the representation of mobiles so that the constructors are
; (define (make-mobile left right)
;   (cons left right))

; (define (make-branch length structure)
;   (cons length structure))
; How much do you need to change your programs to convert to the new representation?

; Answer: I guess I'll have to change only selectors.
