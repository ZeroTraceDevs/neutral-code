// nc_engine.js - Der Übersetzer
const NCEngine = {
    execute: function(command, payload) {
        if (command === "print") {
            console.log("NC-Output: " + payload);
        } else if (command === "hello") {
            console.log("Neutral Code sagt: Hello World!");
        }
    }
};