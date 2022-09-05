#lang at-exp racket

(require "macro-kit.rkt")

(define-global (BoldSymbol x)
  (match (target)
    ['katex @raw{\pmb{@x}}]
    [_ @raw{\boldsymbol{@x}}]))

(define-locals*
  [(OpnsSymbol) (BoldSymbol @raw{\mathcal{O}})]
  [(bold kwd) @raw{\mathbf{@kwd}}]
  [(overline x) @raw{\overline{@x}}]
  [(underline x) @raw{\underline{@x}}])

(define-globals*
  [(Sub x) "_{" x "}"]
  [(Sup x)  "^{" x "}"]
  [(tick) @raw{'}]
  [(brc x) @raw{\{ @x \}}]
  [(gl x) @raw{\langle @x \rangle}]
  [(brk x) @raw{[@x]}]
  [(prn x) @raw{(@x)}]
  [(vrt x) @raw{\vert @x \vert}]
  [(Con x) @raw{\mathsf{@x}}]
  [(Opns X) (OpnsSymbol) (prn X)]
  [(OpCat C) C (Sup (Con "o"))]
  [(Cod C) (Con "cod") (Sub C)]
  [(REL E) (bold "Rel") (prn E)]
  [(ObjMono X Y) (underline (bold "Mono")) (prn (raw X "," Y))]
  [(TOP E) (bold "Top") (Sub E)]
  [(Idn x) "1" (Sub x)]
  [(SelfIx B) @raw{\underline{@B}}]
  [(Sl E e) E (Sub @raw{/@e})]
  [(CoSl e E) E (Sup @raw{\setminus @e})]
  [(InvImg f) f (Sup @raw{*})]
  [(DirImg f) f (Sub @raw{*})]
  [(SET) (bold "Ens")]
  [(ObjTerm E) (bold "1") (Sub E)]
  [(Ob E) (vrt E)]
  [(ECat) @raw{\mathcal{E}}]
  [(Hom E X Y) (bold "Hom") (Sub E) (brk @raw{@X,@Y})]
  [(Monos E X Y) (bold "Mono") (Sub E) (brk @raw{@X,@Y})])


(publish-macro-library 'benabou)
