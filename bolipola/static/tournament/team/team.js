const imageGroup = document.querySelector(".box__legend-img")
const imageInput = document.querySelector(".box__legend-input")
const teamInf = document.querySelector("#teamInf")
const inputsInf = document.querySelectorAll("[group='requeriment']")
const groupImg = document.querySelectorAll(".box__legend-img")

function setInputChanges() {
    inputsInf.forEach((element, i) => {
        element.value = teamInf.children[i].innerHTML
    })
}

//Colocador de imágen
imageInput.addEventListener("change", (e) => {
    let file = e.target.files[0]
    let reader = new FileReader()

    if (file == undefined) {
        return false
    }
    
    reader.readAsDataURL(file)

    reader.onload = () => {
        imageGroup.src = reader.result
    }
})

setInputChanges()