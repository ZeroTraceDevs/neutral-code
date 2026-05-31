const NCCore = {
    render: (t, v) => { const e = document.createElement(t); e.innerText = v; document.getElementById('app').appendChild(e); },
    init: async () => { 
        const app = document.createElement('div'); app.id = 'app'; document.body.appendChild(app);
        const r = await fetch('demo.nc'); NCCore.process(await r.text()); 
    },
    process: (c) => {
        c.split('\n').forEach(l => {
            const [cmd, ...v] = l.split(':');
            if(cmd === 'h1' || cmd === 'p' || cmd === 'button') NCCore.render(cmd, v.join(':'));
        });
    }
};
NCCore.init();
