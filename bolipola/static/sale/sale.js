const typeSale = document.querySelector("#typeSale")
const totalCost = document.querySelector("#totalCost")
const information = document.querySelector("#infList")

function setValuesInSomeInputs() {
    typeSale.value = information.children[0].innerHTML
    totalCost.value = Number(information.children[1].innerHTML.slice(0, -2)) //Se debe parsear el valor para que valga como número
}

setValuesInSomeInputs()