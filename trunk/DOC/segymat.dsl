<!DOCTYPE style-sheet PUBLIC "-//James Clark//DTD DSSSL Style Sheet//EN" [
<!ENTITY % html "IGNORE">
<![%html;[
<!ENTITY % print "IGNORE">
<!ENTITY docbook.dsl PUBLIC "-//Norman Walsh//DOCUMENT DocBook HTML Stylesheet//EN" CDATA dsssl>
]]>
<!ENTITY % print "INCLUDE">
<![%print;[
<!ENTITY docbook.dsl PUBLIC "-//Norman Walsh//DOCUMENT DocBook Print Stylesheet//EN" CDATA dsssl>
]]>
]>



<style-sheet>

<style-specification id="print" use="docbook">
<style-specification-body> ;; customize the print stylesheet

;;======================================
;;Margins
;;======================================

(define %left-right-margin% 3pi)

;;How much indentation for the body?
(define %body-start-indent% 
 0pi)
;; was 0pi

;;How big is the left margin? (relative to physical page)
(define %left-margin% 
 5pi) ;white-paper-column

;;How big is the right margin? (relative to physical page)
(define %right-margin% 
 5pi) ;white-paper-column

;;How big do you want the margin at the top?
(define %top-margin%
(if (equal? %visual-acuity% "large-type")
      7.5pi
      6pi))

;;How big do you want the margin at the bottom?
(define %bottom-margin% 
 (if (equal? %visual-acuity% "large-type")
      7.5pi 
      5pi))

;;Define the text width. (Change the elements in the formula rather
;;than the formula itself)
;(define %text-width% (- %page-width% (* %left-right-margin% 2)))
(define %text-width%  (- %page-width% (+ %left-margin% %right-margin%)))

;;Define the body width. (Change the elements in the formula rather
;;than the formula itself)
(define %body-width% 
 (- %text-width% %body-start-indent%))

;;Define distance between paragraphs
(define %para-sep% 
 (/ %bf-size% 2.0))

;;Define distance between block elements (figures, tables, etc.).
(define %block-sep% 
 (* %para-sep% 2.0))

;;Indent block elements?
(define %block-start-indent% 
  14pt)
;0pt

(define %visual-acuity%
  ;; General measure of document text size
  ;; "presbyopic"
  ;; "large-type"
  "presbyopic")

(define %two-side% #f)

(define %section-autolabel% 
  ;; Are sections enumerated?
  #t)
;; (define %title-font-family% 
;;   ;; The font family used in titles
;;   "Ariel")

 (define %title-font-family% 
   ;; The font family used in titles
   "Arial")


 (define %font-family% 
   ;; The font family used in titles
   "Times")


</style-specification-body>
</style-specification>


<style-specification id="html" use="docbook">
<style-specification-body> ;; customize the html stylesheet


; === TMH ADDITIONS ===                                                         
(define (chunk-element-list)
  (list (normalize "preface")
        (normalize "chapter")
        (normalize "appendix")
        (normalize "article")
        (normalize "glossary")
        (normalize "bibliography")
        (normalize "index")
        (normalize "colophon")
        (normalize "setindex")
        (normalize "reference")
        (normalize "refentry")
        (normalize "part")
        (normalize "sect1")
        (normalize "sect2")
        (normalize "section")
        (normalize "book") ;; just in case nothing else matches...                      
        (normalize "set")  ;; sets are definitely chunks...
))



(define %use-id-as-filename%
  ;; Use ID attributes as name for component HTML files?
  #t)


;; this is necessary because right now jadetex does not understand
;; symbolic entities, whereas things work well with numeric entities.
(declare-characteristic preserve-sdata?
          "UNREGISTERED::James Clark//Characteristic::preserve-sdata?"
          #f)

;; put the legal notice in a separate file
(define %generate-legalnotice-link%
  #t)

;; use graphics in admonitions, and have their path be "stylesheet-images"
;; NO: they do not yet look very good
(define %admon-graphics-path%
  "./stylesheet-images/")
(define %admon-graphics%
  #f)

;; make funcsynopsis look pretty
(define %funcsynopsis-decoration%
  ;; Decorate elements of a FuncSynopsis?
  #t)

(define %html-ext% ".html")
(define %body-attr%
  ;; What attributes should be hung off of BODY?
  '())
;;  (list
;;   (list "BGCOLOR" "#FFFFFF")
;;   (list "TEXT" "#000000")))

(define %generate-article-toc% 
  ;; Should a Table of Contents be produced for Articles?
  ;; If true, a Table of Contents will be generated for each 'Article'.
  #t)

(define %generate-part-toc% #f)

(define %shade-verbatim%
  #t)

(define %graphic-default-extension% "jpg")


;;Default extension for filenames?
(define %html-ext% 
  ".html")

;;Use it
(define %stylesheet-type% 
"text/css")

;;Use a CSS stylesheet?
;;Which one? Should work on 
;;this one soon
 (define %stylesheet% "style.css")
 (define %stylesheet-type% "text/css")



</style-specification-body>
</style-specification>
<external-specification id="docbook" document="docbook.dsl">

</style-sheet>


