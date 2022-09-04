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

(publish-macro-library 'guitart)
