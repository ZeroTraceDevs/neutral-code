#!/bin/bash

# 1. Bereinigung: demo.nc sortieren
if [ -f demo.nc ]; then
    sort -u demo.nc -o demo.nc
fi

# 2. Status-Check
echo "--- Prüfe Änderungen... ---"
git status --short

# 3. Alles hinzufügen
git add .

# 4. Commit mit Nachricht (falls keine Nachricht übergeben, nimm Zeitstempel)
MSG=${1:-"System Update: $(date '+%Y-%m-%d %H:%M:%S')"}
git commit -m "$MSG"

# 5. Push zum Server
git push

echo "--- ALLES SICHER GESPEICHERT UND GEPUSTET ---"
