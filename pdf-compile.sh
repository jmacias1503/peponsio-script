for i in {1..150}; do
	pdflatex -jobname="$i" template.tex
done
