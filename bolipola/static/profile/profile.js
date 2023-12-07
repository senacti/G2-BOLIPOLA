const inputFirstName = document.querySelector("#input_first_name")
const inputLastName = document.querySelector("#input_last_name")
const textName = document.querySelector("#text_name")
const inputs = document.querySelectorAll("input")
const buttons = document.querySelectorAll("button")
const selectGender = document.querySelector("select")
const cancelButton = document.querySelector("#cancel")
const edit = document.querySelector(".box__left-box-edit-button")
const changePassword = document.querySelector(".box__left-box-changePass-a")
const defaultImage = document.querySelector(".box__legend-img")
const inputImgBackground = document.querySelector("#modificadorInputFile")
const inputImgHelp = document.querySelector(".box__legend-imgIndication")
const inputImgDef = document.querySelector(".box__legend-imgDef")
const inputImg = document.querySelector(".box__legend-input")
const inputBirthDate = document.querySelector("#birthdate")
const birthDay = document.querySelector(".birthdateDay")
const birthMonth = document.querySelector(".birthdateMonth")
const birthYear = document.querySelector(".birthdateYear")
const rango = document.querySelector(".rangoNumber")
const shopList = document.querySelector(".box__right-list")
const imgOfNone = document.querySelector(".box__right-list-none")
const iconRange = document.querySelector(".box__left-title-rango i")
const advRange = document.querySelector(".container_inf_rango")

function setNames() {
    //Lo que este en el value de input se pondrá en el span del nombre
    textName.innerHTML = `${inputFirstName.value} ${inputLastName.value}`

    return true
}

//Colocando fecha de la base de datos al usuario
function setBirthdate() {
    day = birthDay.innerHTML
    month = birthMonth.innerHTML
    year = birthYear.innerHTML

    if (month.length == 1) {
        month = `0${month}`
    }

    if (day.length == 1) {
        day = `0${day}`
    }

    return inputBirthDate.value = `${year}-${month}-${day}`
}

//Evento al editar
edit.addEventListener("click", () => {
    //Ocultando span de nombre    
    textName.setAttribute("hidden", "true")

    //Quitando ocultos o deshabilitados de los inputs
    inputs.forEach((element) => {
        //Si es email no se podrá cambiar
        if (element.id == "unique") {
            return
        }

        element.removeAttribute("disabled")
        element.removeAttribute("hidden")
    })

    //Quitando ocultos o deshabilitados de los buttons
    buttons.forEach((element) => {
        element.removeAttribute("disabled")
        element.removeAttribute("hidden")
    })

    //Quitando oculto del select gender
    selectGender.removeAttribute("disabled")

    //Mostrando link para cambiar contraseña
    changePassword.removeAttribute("hidden")

    //Ajustando avatar editable
    defaultImage.setAttribute("hidden", "true")
    inputImgBackground.style.cssText = `
        height: 12rem;
        width: 12rem;
    `
    inputImgHelp.removeAttribute("hidden")
    inputImgDef.removeAttribute("hidden")
})

cancelButton.addEventListener("click", () => {
    //Reinicia la página el botón cancelar
    window.location.reload();
})

// Colocando mensaje de aviso al pasar por encima
iconRange.addEventListener("mouseover", () => {
    advRange.removeAttribute("hidden")
})

iconRange.addEventListener("mouseout", () => {
    advRange.setAttribute("hidden", "true")
})

//Colocando imágen al cambiarla
inputImg.addEventListener("change", (e) => {
    let file = e.target.files[0]
    let reader = new FileReader()

    if (file == undefined) {
        return false
    }
    
    reader.readAsDataURL(file)

    reader.onload = () => {
        inputImgDef.src = reader.result
    }
})

setNames()
setBirthdate()