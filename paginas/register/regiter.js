const avatarDiv = document.querySelector("#modificadorInputFile")
const avatarInput = document.querySelector("#colocadorImg")

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