const hearths = document.querySelectorAll(".comment-like [name='no-liked'], .comment-like [name='liked']");
const filterForm = document.querySelector("#commentFilterForm");
const filterSelect = document.querySelector("#commentFilterSelect");
let commented = document.querySelector("#commented-bool").innerHTML;
let filterName = document.querySelector("#filter-name").innerHTML;
let scoreAdmin = document.querySelector("#scoreAdmin-bool").innerHTML;

function obtenerCSRFToken() {
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

function delHearth(comment_id) {
    fetch(`/del_like/`, {
        method: 'POST',  // Puedes usar POST o GET según tus necesidades
        headers: {
            'X-CSRFToken': obtenerCSRFToken(), // Asegúrate de incluir el token CSRF si lo necesitas
        },
        body: JSON.stringify({
            comment_id
        }),
    })
    .then(response => response.json())
    .then(data => {
        data
    })
    .catch(error => {
        console.error('Error:', error);
    });
}

function addHearth(comment_id) {
    fetch(`/add_like/`, {
        method: 'POST',
        headers: {
            'X-CSRFToken': obtenerCSRFToken(), // Asegúrate de incluir el token CSRF si lo necesitas
        },
        body: JSON.stringify({
            comment_id
        }),
    })
    .then(response => response.json())
    .then(data => {
        data
    })
    .catch(error => {
        console.error('Error:', error);
    });
}

function uptdateHearth(hearth) {
    score = Number(hearth.parentNode.children[3].innerHTML);
    id = Number(hearth.getAttribute("id"))

    if (hearth.getAttribute("name") == "no-liked") {
        if (scoreAdmin == "true") {
            hearth.parentNode.children[0].style.display = "block";
        }
        hearth.parentNode.children[2].style.display = "block";
        hearth.style.display = "none";
        score++;
        addHearth(id);

    } else {
        if (scoreAdmin == "true") {
            hearth.parentNode.children[0].style.display = "none";
        }
        hearth.parentNode.children[1].style.display = "block";
        hearth.style.display = "none";
        score--;
        delHearth(id);
    }

    hearth.parentNode.children[3].innerHTML = score;
}

hearths.forEach(element => {
    element.addEventListener("click", () => {
        return uptdateHearth(element);
    })
})

filterSelect.addEventListener("change", () => {
    filterForm.action = `/comment/filter/${filterSelect.value}/`;
    filterForm.submit();
})
filterSelect.value = filterName

if (commented == "true") {
    filterSelect.focus();
}