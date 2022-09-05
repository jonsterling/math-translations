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

(define-cats Cat Ab Set Prof Grp Elts)

(define-global (xto)
  "\\xrightarrow")

(define-global (vf)
  "\\varphi")

(define-global (To)
  "\\Rightarrow")

(define-global (tdown)
  "\\mathop{\\triangledown}")
(define-global (btdown)
  "\\mathop{\\blacktriangledown}")

(define-global (mop x)
  @raw{\text{@x}})

(define-syntax-rule (declare-mop name ...)
  (begin
    (define-global (name)
      (mop (id->string name)))
    ...))

(declare-mop colim op Ran Lan)


(define-global (firstblank)
  "-")

(define-global (sndblank)
  "=")

(define-global (esq x y z w)
  @raw{@x \xrightarrow[@y]{@z}@w})

(define-global (smat x)
  @raw{\left( \begin{smallmatrix} @x \end{smallmatrix} \right)})

(define-global (nbsmat x)
  @raw{\begin{smallmatrix} @x \end{smallmatrix}})

(define-global (tick)
  @raw{'})


(publish-macro-library 'guitart)
