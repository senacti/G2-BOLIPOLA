let openShopping = document.querySelector('.shopping');
let closeShopping = document.querySelector('.closeShopping');
let list = document.querySelector('.list');
let listCard = document.querySelector('.listCard');
let body = document.querySelector('body');
let total = document.querySelector('.total');
let quantity = document.querySelector('.quantity');
let items = document.querySelectorAll('.item')
let addButtons = document.querySelectorAll('.Boton1')

openShopping.addEventListener('click', () => {
  body.classList.add('active');
})

closeShopping.addEventListener('click', () => {
  body.classList.remove('active');
})

let products = [];
let listCards = [];

function parseAndEvents(array) {
  items.forEach((element, i) => {
    array.push(
      {
        id: Number(element.children[i].id),
        name: element.children[1].innerHTML,
        price: Number(element.children[6].innerHTML.slice(0, -2)),
        image: element.children[0].attributes.src.nodeValue,
     },
    )
    element.children[5].addEventListener('click', (e) => {
      addToCard(i)
    })
  })
}
parseAndEvents(products)

function addToCard(key) {
    if (listCards[key] == null) {
        // Copia el producto de la lista a la lista de la tarjeta
        listCards[key] = JSON.parse(JSON.stringify(products[key]));
        listCards[key].quantity = 1;
        // Incrementa el precio total
        listCard.totalPrice += listCards[key].price;
    } else {
        // Si el producto ya está en la tarjeta, incrementa la cantidad y el precio total en consecuencia
        listCards[key].quantity++;
        listCards[key].price += products[key].price;
    }
    reloadCard();
}

function changeQuantity(key, quantity) {
    if (quantity <= 0) {
        // Decrementa el precio total cuando se elimina un elemento del carrito
        listCard.totalPrice -= listCards[key].price;
        delete listCards[key];
    } else {
        // Actualiza la cantidad y el precio total
        listCards[key].quantity = quantity;
        listCards[key].price = quantity * products[key].price;
        listCard.totalPrice += (quantity - 1) * products[key].price;
    }
    reloadCard();
}

function reloadCard() {
  listCard.innerHTML = '';
  let count = 0;
  let totalPrice = 0;
  listCards.forEach((value, key) => {
    if (value != null) {
      totalPrice = totalPrice + value.price;
      count = count + value.quantity;

      let newDiv = document.createElement('li');
      newDiv.innerHTML = `
        <div class="img-slide"><img src="${value.image}"/></div>
        <div class="text-slide">${value.name}</div>
        <div class="text-slide">${value.price.toLocaleString()}</div>
        <div>
          <button onclick="changeQuantity(${key}, ${value.quantity - 1})"><i class="fa-solid fa-minus"></i></button>
          <div class="count">${value.quantity}</div>
          <button onclick="changeQuantity(${key}, ${value.quantity + 1})"><i class="fa-solid fa-plus"></i></button>
          <input type='hidden' name='priceInput' value='${value.price}'>
          <input type='hidden' name='quantityInput' value='${value.quantity}'>
        </div>`;
      listCard.appendChild(newDiv);
    }
  });
  total.innerText = totalPrice.toLocaleString();
}