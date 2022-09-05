#lang at-exp racket

(require "macro-kit.rkt")

(define-globals*
  [(Sub x) "_{" x "}"]
  [(Sup x)  "^{" x "}"]
  [(tick) @raw{'}]
  [(brc x) @raw{\{ @x \}}]
  [(gl x) @raw{\langle @x \rangle}]
  [(brk x) @raw{[@x]}]
  [(prn x) @raw{(@x)}]
  [(vrt x) @raw{\vert @x \vert}]
  [(ET) @raw{\mathrm{Et}}]
  [(Sh C) @raw{\widetilde{@C}}]
  [(Yo) @raw{\mathop{\epsilon}}]
  [(Sum i) @raw{{\textstyle\sum}\Sub{@i}}]
  [(Prod i) @raw{{\textstyle\prod}\Sub{@i}}]
  [(TopIdent X) @raw{\underline{@X}}]
  [(ETop) @TopIdent{E}]
  [(FTop) @TopIdent{F}]
  [(InvImg f) f (Sup @raw{*})]
  [(DirImg f) f (Sub @raw{*})]
  [(BoldSymbol x)
   (match (target)
     ['katex @raw{\pmb{@x}}]
     [_ @raw{\boldsymbol{@x}}])]
  [(Str x) @raw{\mathcal{O}@Sub{@x}}]
  [(StrTop X) (prn (raw X "," (Str X)))]
  [(GSec) @raw{\mathop{@BoldSymbol{\Gamma}}}]
  [(AffLine) @raw{\mathbb{A}}@Sup{1}]
  [(Idn) @raw{\mathrm{Id}}]
  [(RR) @raw{\mathbb{R}}])

(publish-macro-library 'coste)
