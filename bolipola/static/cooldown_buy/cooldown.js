const abortController = new AbortController();
let send = "0";
let sum = 0;

if (!localStorage.getItem("cooldownToQuit")) {
    localStorage.setItem("cooldownToQuit", sum);
}

function getCSRFToken() {
    // Obtiene el token CSRF de las cookies
    const cookies = document.cookie.split(';');
    for (let i = 0; i < cookies.length; i++) {
        const cookie = cookies[i].trim();
        if (cookie.startsWith('csrftoken=')) {
            return cookie.split('=')[1];
        }
    }
    return null;
}

// Lógica para disminuir el cooldown con python del usuario
function sendJson() {
    send = String(localStorage.getItem("cooldownToQuit"));

    fetch(`/cooldown/`, {
        method: 'POST', 
        headers: {
            'X-CSRFToken': getCSRFToken(),
        },
        body: JSON.stringify({
            send
        }),
    })
    .then(response => response.json())
    .then(data => {
        data
        localStorage.setItem("cooldownToQuit", 0);
    })

    .catch(error => {
        console.error('Error:', error);
    });
}

window.addEventListener('beforeunload', e => {
    clearInterval(intervalo);
    sendJson();
})

if (localStorage.getItem("cooldownToQuit")) {
    sendJson();
}

let intervalo = setInterval(() => {
    sum++;
    localStorage.setItem("cooldownToQuit", sum);
}, 1000)