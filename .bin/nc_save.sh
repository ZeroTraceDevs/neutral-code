#!/bin/bash
# 1. Erstelle ein Backup mit Zeitstempel
cp .bin/nc_fast.sh .bin/backup/nc_fast_$(date +%Y%m%d_%H%M%S).sh

# 2. Führe den Build aus
./.bin/nc_fast.sh

# 3. Bestätige die Veränderung
echo "Build abgeschlossen. Snapshot gespeichert."
