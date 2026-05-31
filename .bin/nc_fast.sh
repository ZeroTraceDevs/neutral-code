#!/bin/bash
# High-Speed NC-Compiler
# Variablen-Definitionen
TITLE="Mein System"

# Build-Prozess
{
    echo "<html><body>"
    while IFS=: read -r tag text; do
        # Variablen-Ersetzung: {{TITLE}} wird durch $TITLE ersetzt
        text=${text//\{\{TITLE\}\}/$TITLE}
        
        case $tag in
            h1) echo "<h1>$text</h1>" ;;
            p)  echo "<p>$text</p>" ;;
            button) echo "<button>$text</button>" ;;
        esac
    done < demo.nc
    echo "</body></html>"
} > index.html
echo "Build fertig!"
