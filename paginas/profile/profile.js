const inputFirstName = document.querySelector("#input_first_name")
const inputLastName = document.querySelector("#input_last_name")
const textFirstName = document.querySelector("#text_first_name")
const textLastName = document.querySelector("#text_last_name")

function setNames() {
    textFirstName.innerHTML = inputFirstName.value
    textLastName.innerHTML = inputLastName.value

    return true
}

setNames()