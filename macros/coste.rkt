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
  @raw{\mathop{\epsilon}})

(define-global (Sum i)
  @raw{{\textstyle\sum}\Sub{@i}})

(define-global (Prod i)
  @raw{{\textstyle\prod}\Sub{@i}})

(define-global (TopIdent X)
  @raw{\underline{@X}})

(define-global (ETop)
  @TopIdent{E})

(define-global (FTop)
  @TopIdent{F})

(define-global (InvImg f)
  f (Sup @raw{*}))
(define-global (DirImg f)
  f (Sub @raw{*}))


(define-global (BoldSymbol x)
  (match (target)
    ['katex @raw{\pmb{@x}}]
    [_ @raw{\boldsymbol{@x}}]))

(define-global (Str x)
  @raw{\mathcal{O}}
  (Sub x))

(define-global (StrTop X)
  (prn
   (raw
    X
    ","
    (Str X))))

(define-global (GSec)
  @raw{\mathop{@BoldSymbol{\Gamma}}})

(define-global (AffLine)
  @raw{\mathbb{A}}@Sup{1})

(define-global (Idn)
  @raw{\mathrm{Id}})


(define-global (tick)
  @raw{'})

(publish-macro-library 'coste)
