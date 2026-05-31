#!/bin/bash
# Autopilot: Schreiben, Speichern, Commit, Push
echo "$1" >> demo.nc
git add demo.nc
git commit -m "NC-Framework Update: $1"
git push
echo "Framework-Befehl '$1' verarbeitet und in Cloud gesichert."
