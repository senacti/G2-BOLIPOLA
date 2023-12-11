const tourForm = document.querySelector(".tournament_form");
const buttonTourForm = document.querySelector("#createTournament");
const exitButtonForm = document.querySelector(".exit-create-container button");
const firstInput = document.querySelector("#registerName");
const main = document.querySelector(".main");
const body = document.querySelector("body");
const header = document.querySelector("header");
const finishedInput = document.querySelector("#watchFinishedInput");
const finishedForm = document.querySelector("#formFinishedInput");
let formActive = false;

if (buttonTourForm != null) {
    buttonTourForm.addEventListener("click", () => {
        formActive = true;
        tourForm.style.display = "block";
        main.style.cssText = "opacity: 0.2;";
        header.style.cssText = "opacity: 0.2;";
        firstInput.focus();
    })
}

if (exitButtonForm != null) {
    exitButtonForm.addEventListener("click", () => {
        formActive = false;
        tourForm.style.display = "none";
        main.style.cssText = "opacity: 1;";
        header.style.cssText = "opacity: 1;";
    })
}

//Se envía solo el formulario si se desea crear un torneo
window.addEventListener("click", (e) => {
    if (e.target.className == "buttonActive") {
        return;
    }

    if (formActive) {
        return e.preventDefault();
    }
})

finishedInput.addEventListener("change", () => {
    finishedForm.submit();
})