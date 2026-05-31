#!/bin/bash
OUTPUT="index.html"
echo "<html><body>" > "$OUTPUT"

while IFS=: read -r tag part1 part2; do
    case $tag in
        h1) echo "<h1>$part1</h1>" >> "$OUTPUT" ;;
        p)  echo "<p>$part1</p>" >> "$OUTPUT" ;;
        button) echo "<button>$part1</button>" >> "$OUTPUT" ;;
        # Hier ist der neue "Link-Modus": link:Text:URL
        link) echo "<a href='$part2'><button>$part1</button></a>" >> "$OUTPUT" ;;
    esac
done < demo.nc

echo "</body></html>" >> "$OUTPUT"
