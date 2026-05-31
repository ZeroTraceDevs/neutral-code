#!/bin/bash
# Kompiliert demo.nc -> index.html rein mit Bash

echo "<html><body>" > index.html
while IFS=: read -r tag text; do
    case $tag in
        h1) echo "<h1>$text</h1>" >> index.html ;;
        p)  echo "<p>$text</p>" >> index.html ;;
        button) echo "<button>$text</button>" >> index.html ;;
    esac
done < demo.nc
echo "</body></html>" >> index.html

echo "Build abgeschlossen: index.html wurde erzeugt."
