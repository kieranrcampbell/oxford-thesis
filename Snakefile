

rule all:
    input:
        "krc-thesis.pdf"

rule tex2pdf:
    input:
        tex = 'krc-thesis.tex',
        bib = 'Bibliography.bib'
    output:
        'krc-thesis.pdf'
    shell:
        """
        pdflatex {input.tex}
        bibtex krc-thesis
        pdflatex {input.tex}
        pdflatex {input.tex}
        """



rule clean:
    shell:
        """
        mv krc-thesis.pdf krc-thesis-prev.pdf
        rm -f  *.log *.aux *.bbl *.blg *.synctex.gz *.out *.lol *.lot *.lof *.toc *.xml krc-thesis.pdf
        rm FrontBackMatter/*.aux Chapters/*.aux
        """

rule cleanpdf:
    shell:
        "rm krc-thesis.pdf"