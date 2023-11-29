const form = document.querySelector(".form-calendar");
const buttonDay = document.querySelector(".dispButton");
const firstInput = document.querySelector(".input-container input");
let active = false;

buttonDay.addEventListener("click", () => {
    if (!active) {
        form.style.display = "block";
        firstInput.focus();
        active = true;
    } else {
        form.style.display = "none";
        active = false;
    }
})

window.addEventListener("click", (e) => {
    if (e.target.attributes.group == undefined && active) {
        form.style.display = "none";
        active = false;
    }
})