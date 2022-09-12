#lang at-exp racket

(require racket/format)
(require "macro-kit.rkt")

(define-globals*
  [(Sub x) "_{" x "}"]
  [(Sup x) "^{" x "}"]
  [(tick) @raw{'}]
  [(cate x) @raw{\mathsf{@x}}])

(define-syntax-rule (define-cats name ...)
  (define-globals*
    [(name) (cate (id->string name))]
    ...))

(define-cats Cat Ab Set Prof Grp Elts Span Rel VCat Fib)

(define-globals*
  [(xto) @raw{\xrightarrow}]
  [(xot) @raw{\xleftarrow}]
  [(vf) @raw{\varphi}]
  [(To) @raw{\Rightarrow}]
  [(pto) @raw{\rightsquigarrow}]
  [(tdown) @raw{\mathop{\triangledown}}]
  [(btdown) @raw{\mathop{\blacktriangledown}}]
  [(firstblank) @raw{-}]
  [(sndblank) @raw{=}]
  [(mop x) @raw{\text{@x}}])

(define-syntax-rule (declare-mop name ...)
  (define-globals*
    [(name) (mop (id->string name))]
    ...))

(declare-mop colim op Ran Lan Ex Ch)

(define-globals*
  [(esq x y z w) @raw{@x \xrightarrow[@y]{@z}@w}]
  [(smat x) @raw{\left( \begin{smallmatrix} @x \end{smallmatrix} \right)}]
  [(nbsmat x) @raw{\begin{smallmatrix} @x \end{smallmatrix}}])


(publish-macro-library 'guitart)
