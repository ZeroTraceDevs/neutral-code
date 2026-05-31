#!/bin/bash

# 1. Duplikate in demo.nc bereinigen (Safe-Write)
sort -u demo.nc -o demo.nc

# 2. Build durchführen
./nc_fast.sh

# 3. Git-Autopilot
# Prüfen, ob Änderungen existieren
if [ -n "$(git status --porcelain)" ]; then
    git add .
    git commit -m "Auto-Save: $(date '+%Y-%m-%d %H:%M:%S')"
    git push
    echo "--- SYSTEM GESICHERT UND GEPUSTET ---"
else
    echo "--- KEINE ÄNDERUNGEN GEFUNDEN ---"
fi
