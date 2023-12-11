const message = document.querySelector(".message-container")

function removeMessage() {
    if (message == null) {
        return;
    } 

    setTimeout(() => {
        message.style.display = "none";
    }, 4500)
}

removeMessage();