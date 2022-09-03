#lang at-exp racket

(require "macro-kit.rkt")

(define-global (Sub x)
  "_{" x "}")
(define-global (Sup x)
  "^{" x "}")

(define-global (brc x)
  @raw{\{ @x \}})

(define-global (gl x)
  @raw{\langle @x \rangle})

(define-global (brk x)
  @raw{[@x]})

(define-global (prn x)
  @raw{(@x)})

(define-global (vrt x)
  @raw{\vert @x \vert})

(define-global (ET)
  @raw{\mathrm{Et}})

(define-global (Sh C)
  @raw{\widetilde{@C}})

(define-global (Yo)
  @raw{\epsilon})

(define-global (Sum i)
  @raw{{\textstyle\sum}\Sub{@i}})

(define-global (Prod i)
  @raw{{\textstyle\prod}\Sub{@i}})

(define-global (ETop)
  @raw{\underline{E}})


(define-global (BoldSymbol x)
  (match (target)
    ['katex @raw{\pmb{@x}}]
    [_ @raw{\boldsymbol{@x}}]))

(define-global (Str x)
  (BoldSymbol @raw{\mathcal{O}})
  (Sub x))

(publish-macro-library 'coste)
