const NCCore = {
    init: async () => {
        const response = await fetch('demo.nc');
        const data = await response.text();
        NCCore.process(data);
    },
    process: (content) => {
        content.split('\n').forEach(line => {
            const [cmd, arg] = line.trim().split(':');
            if (!cmd || cmd.startsWith('#')) return;
            if (NCCore.actions[cmd]) NCCore.actions[cmd](arg || "");
            else console.warn(`Unbekannter Befehl: ${cmd}`);
        });
    },
    actions: {
        hello: () => console.log("NC: Hello World!"),
        status: () => console.log("NC: System Status Online."),
        terminal: (arg) => console.log(`%c[NC-TERMINAL] ${arg}`, "color: #0f0; background: #000; padding: 2px;")
    }
};
NCCore.init();
