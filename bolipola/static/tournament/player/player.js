const teamName = document.querySelector(".main__right-team-title")
const teamColor = document.querySelector("#teamColor")
const playerInf = document.querySelector("#playerInf")
const inputsInf = document.querySelectorAll(".main__left-form-inf input, .main__left-form-inf select")

//Colocando color al nombre del equipo
function setTeamColor() {
    teamName.style.color = teamColor.innerHTML
}

//Colocando información del jugador en inputs de registro en caso de que se selecciones
function setPlayerInf() {
    if (playerInf.firstElementChild != null) {
        inputsInf.forEach((element, i) => {
            element.value = playerInf.children[i].innerHTML
        })
    }
}

setTeamColor()
setPlayerInf()