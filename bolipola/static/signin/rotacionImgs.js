const imgsContenedor = document.querySelector(".left__imgs")
const buttonLeft = document.querySelector("#flechaLeft")
const buttonRight = document.querySelector("#flechaRight")
const circles = document.querySelectorAll(".left__circles-circle")
let numImg = 0
let intervalImgsVar;
let recargandoStartInterval = false;
let rutas = ["signin/images/example.jpg",
            "signin/images/evento.jpg",
            "signin/images/papas.jpg",
            "signin/images/balon.jpg",
            "signin/images/bolirana.jpg"]

function colocadorImgs() {
    let iterador = -1
    rutas.forEach((ruta) => {
        iterador ++

        let img = document.createElement("img")
        img.src = staticUrl + ruta
        img.className = "left__imgs-img"
        img.number = iterador
        imgsContenedor.appendChild(img)
    })

}

function cambioImg() {
    rutas.forEach((element, i) => {
        imgsContenedor.children[i].hidden = false
        circles[i].style.backgroundColor = "transparent"

        if (imgsContenedor.children[i].number != numImg) {
            imgsContenedor.children[i].hidden = true
        } else {
            circles[i].style.backgroundColor = "#CB4335"
        }
    })
}

//---Funciones para los intervalos de rotar imágenes y detener cuando se da click en un botón durante 8 segundos
const stopInterval = () => {
    if (recargandoStartInterval) {
        return
    }

    clearInterval(intervalImgsVar)
    recargandoStartInterval = true
    setTimeout(() => {
        recargandoStartInterval = false
        startInterval()
    }, 8000)
}

const viewImgs = () => {
    numImg ++
    if (numImg >= rutas.length) {
        numImg = 0
    }
    cambioImg()
}

const startInterval = () => {
    intervalImgsVar = setInterval(viewImgs, 3000)
}
//------------

buttonRight.addEventListener("click", () => {
    numImg ++
    if (numImg >= rutas.length) {
        numImg = 0
    }
    cambioImg()
    stopInterval()
})

buttonLeft.addEventListener("click", () => {
    numImg --
    if (numImg <= -1) {
        numImg = rutas.length - 1
    }
    cambioImg()
    stopInterval()
})

colocadorImgs()
cambioImg()
startInterval()