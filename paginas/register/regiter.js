const avatarDiv = document.querySelector("#modificadorInputFile")
const avatarInput = document.querySelector("#colocadorImg")
const form = document.querySelector(".form")
const pass1 = document.querySelector("#pass1")
const pass2 = document.querySelector("#pass2")
const gender = document.querySelector(".formBox__inf-box-gender-input")

//Validar formulario
form.addEventListener("submit", (e) => {
    let error = false
    let errorMsj = ""

    if (pass2.value != pass1.value) {
        errorMsj += "Confirmación de contraseña no válida \n"
        error = true
    }

    if (error) {
        e.preventDefault() //Evita que se recargue la página y se borren los datos ya puestos
        return alert(`DATOS INVÁLIDOS:\n${errorMsj}`)
    }

    return alert("¡Cuenta creada con éxito!")
})

//Colocador de imágen en el avatar:
avatarInput.addEventListener("change", (e) => {
    let file = e.target.files[0]
    let reader = new FileReader()

    if (file == undefined) {
        return false
    }
    
    reader.readAsDataURL(file)

    reader.onload = () => {
        avatarDiv.style.backgroundImage = `url(${reader.result})`
    }
})