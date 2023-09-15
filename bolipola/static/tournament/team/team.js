const imageGroup = document.querySelector(".box__legend-img")
const imageInput = document.querySelector(".box__legend-input")


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