#lang at-exp racket

(require racket/format)
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
(define-global (Set)
  (cate "Set"))
(define-global (Prof)
  (cate "Prof"))
(define-global (Grp)
  (cate "Grp"))
;;; (for ([i (list 'Cat 'Ab 'Set)])
;;;   (define-global (i)
;;;   (cate (~v i))))

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
  ;;; (x "\xrightarrow[" y "]{" z "}" w))
  @x "\\xrightarrow[" @y "]{" @z "}" @w)
(publish-macro-library 'guitart)