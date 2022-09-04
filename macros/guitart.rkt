#lang at-exp racket

(require "macro-kit.rkt")

(define-global (Sub x)
  "_{" x "}")
(define-global (Sup x)
  "^{" x "}")

(define-global (cate x)
  @raw{\mathsf\{ @x \}})
