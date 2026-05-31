#!/bin/bash
# Befehl: ./nc_run.sh "tag:text:action"

# 1. Schreibe den Befehl in die NC-Datei
echo "$1" >> demo.nc

# 2. Stelle sicher, dass index.html (der Kern) immer aktuell ist
cat << 'CORE' > index.html
<!DOCTYPE html><html><body><div id="app"></div><script>
fetch('demo.nc').then(r=>r.text()).then(t=>{t.split('\n').forEach(l=>{
    if(!l || l.startsWith('#')) return;
    const [tag, txt, act] = l.split(':');
    const e = document.createElement(tag); e.innerText = txt;
    if(act === 'alert') e.onclick = () => alert(txt);
    document.getElementById('app').appendChild(e);
});});
</script></body></html>
CORE

# 3. Synchronisiere alles mit GitHub
git add .
git commit -m "NC-Update: $1"
git push
echo "System aktualisiert: $1"
