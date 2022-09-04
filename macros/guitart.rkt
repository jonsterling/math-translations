#lang at-exp racket

(require "macro-kit.rkt")

(define-global (Sub x)
  "_{" x "}")
(define-global (Sup x)
  "^{" x "}")

(define-global (cate x)
  @raw{\mathsf{@x}})

(define-global (Cat)
  (cate "Cat"))

(define-global (Ab)
  (cate "Ab"))

(define-global (xto)
  "\\xrightarrow")

(define-global (vf)
  "\\varphi")

(define-global (To)
  "\\Rightarrow")

(define-global (esq x y z w)
  ;;; (x "\xrightarrow[" y "]{" z "}" w))
  @x "\\xrightarrow[" @y "]{" @z "}" @w)
(publish-macro-library 'guitart)