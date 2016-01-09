#!/bin/bash
for texfile in *.tex; do
    echo "building image ${texfile%.*}..."
    pdflatex -shell-escape "$texfile" > /dev/null
    mv "${texfile%.*}.png" ../images/
done
