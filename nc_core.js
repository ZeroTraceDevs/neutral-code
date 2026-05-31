const NCCore = {
    render: (type, val) => {
        const el = document.createElement(type);
        el.innerText = val;
        if(type === 'button') {
            el.onclick = () => console.log("NC Event: Button geklickt!");
        }
        document.getElementById('app').appendChild(el);
    },
    init: async () => {
        const app = document.createElement('div'); app.id = 'app'; document.body.appendChild(app);
        const res = await fetch('demo.nc');
        const text = await res.text();
        text.split('\n').forEach(line => {
            const [cmd, ...args] = line.split(':');
            if(cmd && args.length > 0) NCCore.render(cmd, args.join(':'));
        });
    }
};
window.onload = NCCore.init;
