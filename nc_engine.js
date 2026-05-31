// nc_engine.js - Der Parser-Motor
const NCEngine = {
    // Diese Funktion liest den Text aus der .nc Datei
    parseAndRun: function(content) {
        const lines = content.split('\n');
        lines.forEach(line => {
            // Ignoriere Kommentare mit #
            if (line.startsWith('#') || line.trim() === "") return;

            // Suche nach einem Befehl
            if (line.includes("hello")) {
                console.log("NC Parser: Führe 'hello' aus...");
                alert("Neutral Code Framework: Hello World!");
            }
        });
    }
};