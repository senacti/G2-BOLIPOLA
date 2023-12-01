const inputStartTime = document.querySelector("#hora-inicio");
const inputEndTime = document.querySelector("#hora-fin");

function verifyMinutes(node) {
    let minutesStr, hourStr, newTime;
    let time = node.value;
    let minutes = parseInt(time.split(":")[1])
    let hour = parseInt(time.split(":"))

    if (minutes != 30 || minutes != 0) {

        if (minutes > 0 && minutes <= 15) {
            minutes = 0;
        } else if (minutes > 15 && minutes <= 30) {
            minutes = 30;
        } else if (minutes > 30 && minutes <= 45) {
            minutes = 30;
        } else {
            minutes = 0;
            hour++;
        }
    }

    minutesStr = String(minutes);
    hourStr = String(hour);
    if (minutes == 0) {
        minutesStr = "00";
    }
    if (hour >= 0 && hour <= 9) {
        hourStr = "0" + hourStr;
    }

    newTime = `${hourStr}:${minutesStr}`;
    node.value = newTime;
}

inputStartTime.addEventListener("blur", () => {
    verifyMinutes(inputStartTime);
})

inputEndTime.addEventListener("blur", () => {
    verifyMinutes(inputEndTime);
})