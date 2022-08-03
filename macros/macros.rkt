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



(define-global (BoldSymbol x)
  (match (target)
    ['katex @raw{\pmb{@x}}]
    [_ @raw{\boldsymbol{@x}}]))

(define-local (OpnsSymbol)
  (BoldSymbol @raw{\mathcal{O}}))

(define-global (Con x)
  @raw{\mathsf{@x}})

(define-global (Opns X)
  (OpnsSymbol)
  (prn X))

(define-local (overline x)
  @raw{\overline{@x}})

(define-global (OpCat C)
  C (Sup (Con "o")))

(define-global (Cod C)
  (Con "cod")
  (Sub C))

(define-local (bold kwd)
  @raw{\mathbf{@kwd}})

(define-global (REL E)
  (bold "Rel")
  (prn E))


(define-global (TOP E)
  (bold "Top")
  (Sub E))

(define-global (Idn x)
  "1" (Sub x))

(define-global (SelfIx B)
  @raw{\underline{@B}})

(define-global (Sl E e)
  E (Sub @raw{/@e}))

(define-global (CoSl e E)
  E (Sup @raw{\setminus @e}))


(define-global (InvImg f)
  f (Sup @raw{*}))
(define-global (DirImg f)
  f (Sub @raw{*}))

(define-global (SET)
  (bold "Set"))

(define-global (tick)
  @raw{'})

(define-global (ObjTerm E)
  (bold "1") (Sub E))

(define-global (Ob E)
  (vrt E))

(define-global (ECat)
  @raw{\mathcal{E}})

(define-global (Hom E X Y)
  (bold "Hom")
  (Sub E)
  (brk
   (raw X "," Y)))


(publish-macro-library 'macros)
