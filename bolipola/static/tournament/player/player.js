const rightList = document.querySelector(".main__right-list")
const rightListAdversiment =  document.querySelector(".main__right-list-adversiment")

function setAdversiment() {
    firstElementIsAdversiment = rightList.firstElementChild.attributes.class.value == "main__right-list-adversiment"
    if (!firstElementIsAdversiment) {
        rightListAdversiment.style.display = "none"
    }
}

setAdversiment()