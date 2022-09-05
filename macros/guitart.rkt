#lang at-exp racket

(require racket/format)
(require "macro-kit.rkt")

(define-global (Sub x)
  "_{" x "}")
(define-global (Sup x)
  "^{" x "}")

(define-global (cate x)
  @raw{\mathsf{@x}})


(define-syntax-rule (define-cats name ...)
  (begin 
    (define-global (name)
      (cate (id->string name)))
    ...))

(define-cats Cat Ab Set Prof Grp)

(define-global (xto)
  "\\xrightarrow")

(define-global (vf)
  "\\varphi")

(define-global (To)
  "\\Rightarrow")

(define-global (firstblank)
  "-")

(define-global (sndblank)
  "=")

(define-global (esq x y z w)
  @raw{@x \xrightarrow[@y]{@z}@w})

(publish-macro-library 'guitart)
