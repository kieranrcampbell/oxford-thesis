




rule tex2pdf_with_bib:
    input:
        tex = 'krc-thesis.tex',
        bib = 'Bibliography.bib'
    output:
        'krc-thesis.pdf'
    shell:
        "pdflatex {input.tex}"
        "bibtex {input.bib}"
        "pdflatex {input.tex}"
        "pdflatex {input.tex}"


rule clean:
    shell:
        "rm -f  *.log *.aux *.bbl *.blg *.synctex.gz *.out *.lol *.lot *.lof *.toc *.xml"
        "rm FrontBackMatter/*.aux Chapters/*.aux"