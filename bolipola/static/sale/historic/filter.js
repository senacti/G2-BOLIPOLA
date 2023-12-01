const filtersStatus = document.querySelectorAll(".status-filter");
const filtersDate = document.querySelectorAll(".date-filter");
const filterCancel = document.querySelector("#cancel");
const dataRow = document.querySelectorAll(".data-row");
let confirmated = true, process = true, cancel = false, dayActive = "", monthActive = "all", yearActive = "all"; 

// Lógica para acomodar todos los filtros mediante una condicional amplia
function put() {
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
        }
    })
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