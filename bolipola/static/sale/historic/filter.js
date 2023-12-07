const filtersStatus = document.querySelectorAll(".status-filter");
const filtersDate = document.querySelectorAll(".date-filter");
const filterCancel = document.querySelector("#cancel");
const watchProfits = document.querySelector("#watch-calculated-money");
const watchProfitsDate = document.querySelector("#indicate-date span");
const dataRow = document.querySelectorAll(".data-row");
const adversiment = document.querySelector("#adversiment");
const selectYear = document.querySelector("#year");
const selectMonth = document.querySelector("#month");
const selectDay = document.querySelector('#day');
let confirmated = true, process = true, cancel = true, dayActive = "", monthActive = "all", yearActive = "all"; 

if (watchProfits != null && watchProfitsDate != null) {
    function putProfits(cost) {
        watchProfits.style.color = "black";
        let moneyResult = "<span style='color: #145A32; margin-right: 0.2rem;'>$</span>" + cost.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
        let dateResult = "";
    
        watchProfits.innerHTML = moneyResult;
    
        if (!confirmated) {
            dateResult = "Confirmados desactivado";
            watchProfits.style.color = "#b74033";
            return watchProfits.innerHTML = dateResult;
        }
    
        if (dayActive == "" && monthActive == "all" && yearActive == "all") {
            dateResult += "en todo este tiempo";
        }
    
        if (dayActive != "") {
            if (monthActive == "all" || yearActive == "all") {
                dateResult += `días ${selectDay.value} `;
            } else {
                dateResult += `día ${selectDay.value} `;
            }
        }
    
        if (monthActive != "all") {
            dateResult += `de ${selectMonth.selectedOptions[0].innerHTML.toLowerCase()} `;
        }
    
        if (yearActive != "all") {
            dateResult += `de ${selectYear.value}`;
        }
    
        return watchProfitsDate.innerHTML = dateResult;
    }
}

function calculateProfits() {
    let arrayMoney = [];
    let result = 0;
    
    dataRow.forEach(element => {
        if (element.getAttribute("hidden")) {
            return;
        }

        if (element.cells.namedItem('status').innerHTML == "En proceso..." 
            || 
            element.cells.namedItem('status').innerHTML == "Cancelado") {
            return;
        }

        arrayMoney.push(Number(element.cells.namedItem('cost').innerHTML.replace(/\D/g, '')))
    })

    arrayMoney.forEach(cost => {
        result += cost;
    })

    if (watchProfits != null && watchProfitsDate != null) {
        putProfits(result);
    }
}

function putAdversiment(hide) {
    if (hide) {
        adversiment.style.display = "none";
    } else {
        adversiment.style.display = "grid";
    }
}

// Lógica para acomodar todos los filtros mediante una condicional amplia
function put() {
    totalHidden = 0;

    //Ajustando colores
    if (yearActive == "all") {
        selectYear.style.color = "#b74033";
    } else {
        selectYear.style.color = "black";
    }

    if (monthActive == "all") {
        selectMonth.style.color = "#b74033";
    } else {
        selectMonth.style.color = "black";
    }

    //Escondiendo o mostrando según la lógica
    dataRow.forEach(element => {
        let type = element.cells.namedItem('status').innerHTML;
        let statusBool;

        if (type == "Comprado") {
            statusBool = confirmated
        } else if (type == "En proceso...") {
            statusBool = process
        } else {
            statusBool = cancel
        }

        if (
            ((element.cells.namedItem('date').attributes.year.value == yearActive || yearActive == "all")
                && 
            (element.cells.namedItem('date').attributes.month.value == monthActive || monthActive == "all")
                &&
            (element.cells.namedItem('date').attributes.day.value == dayActive || dayActive == ""))
            &&
            statusBool
        ) {
            element.removeAttribute("hidden");
        } else {
            element.setAttribute("hidden", "true");
            totalHidden++;
        }
    })

    calculateProfits();
    if (totalHidden == dataRow.length) {
        putAdversiment(false);
    } else {
        putAdversiment(true);
    }
}

function filterDate(value_year, value_month, value_day) {
    dayActive = value_day, monthActive = value_month, yearActive = value_year;
    put();
}

filtersStatus.forEach(element => {
    element.addEventListener(("change"), (e) => {
        let type;
        if (element.id == "confirm") {
            confirmated = e.target.checked;
            type = "Comprado";
        }
        if (element.id == "process") {
            process = e.target.checked;
            type = "En proceso...";
        }
        if (element.id == "cancel") {
            cancel = e.target.checked;
            type = "Cancelado";
        }

        put();
    })
})

filtersDate.forEach(element => {
    element.addEventListener(("input"), () => {
        let day, month, year;
        filtersDate.forEach(element => {
            if (element.id == "year") {
                year = element.value;
            }

            if (element.id == "month") {
                month = element.value;
            }

            if (element.id == "day") {
                day = element.value;
            }
        })
        filterDate(year, month, day);
    })
})

put();