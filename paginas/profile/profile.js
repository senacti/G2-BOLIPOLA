const inputFirstName = document.querySelector("#input_first_name")
const inputLastName = document.querySelector("#input_last_name")
const textFirstName = document.querySelector("#text_first_name")
const textLastName = document.querySelector("#text_last_name")
const inputs = document.querySelectorAll("input")
const buttons = document.querySelectorAll("button")
const cancelButton = document.querySelector("#cancel")
const edit = document.querySelector(".box__left-box-edit-button")
const changePassword = document.querySelector(".box__left-box-changePass-a")
const defaultImage = document.querySelector(".box__legend-img")
const inputImgBackground = document.querySelector("#modificadorInputFile")
const inputImgHelp = document.querySelector(".box__legend-imgIndication")

function setNames() {
    //Lo que este en el value de input se pondrá en el span del nombre
    textFirstName.innerHTML = inputFirstName.value
    textLastName.innerHTML = inputLastName.value

    return true
}

edit.addEventListener("click", () => {
    //Ocultando span de nombre    
    textFirstName.setAttribute("hidden", "true")
    textLastName.setAttribute("hidden", "true")

    //Quitando ocultos de los inputs
    inputs.forEach((element) => {
        element.removeAttribute("disabled")
        element.removeAttribute("hidden")
    })

    //Quitando ocultos de los buttons
    buttons.forEach((element) => {
        element.removeAttribute("disabled")
        element.removeAttribute("hidden")
    })

    //Mostrando link para cambiar contraseña
    changePassword.removeAttribute("hidden")

    //Ajustando avatar editable
    defaultImage.setAttribute("hidden", "true")
    inputImgBackground.style.cssText = `
        height: 12rem;
        width: 12rem;
    `
    inputImgHelp.removeAttribute("hidden")
})

cancelButton.addEventListener("click", () => {
    //Reinicia la página el botón cancelar
    window.location.reload();
})

setNames()