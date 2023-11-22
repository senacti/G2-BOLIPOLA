let openShopping = document.querySelector('.shopping');
let closeShopping = document.querySelector('.closeShopping');
let list = document.querySelector('.list');
let listCard = document.querySelector('.listCard');
let body = document.querySelector('body');
let total = document.querySelector('.totalPrice');
let quantity = document.querySelector('.quantity');
let items = document.querySelectorAll('.item');
let addButtons = document.querySelectorAll('.Boton1');
let listCardsToLoad = document.querySelectorAll('.loads_span')
let carVisible = false

openShopping.addEventListener('click', () => {
  body.classList.add('active');
  carVisible = true
})

closeShopping.addEventListener('click', () => {
  body.classList.remove('active');
  carVisible = false
})

window.addEventListener('click', (e) => {
  if (e.target.attributes.closeCar != undefined) {
    body.classList.remove('active');
    carVisible = false
  }
})

let products = [];
let listCards = [];

function parseAndEvents(array) {
  items.forEach((element, i) => {
    array.push(
      {
        id: Number(element.children[5].id),
        name: element.children[1].innerHTML,
        price: Number(element.children[6].innerHTML.slice(0, -2)),
        image: element.children[0].attributes.src.nodeValue,
        quantity: Number(element.children[3].children[0].innerHTML)
     },
    )
    element.children[5].addEventListener('click', (e) => {
      addToCard(i)
    })
  })
}
parseAndEvents(products)

function addToCard(key) {
    //En caso de que sobrepase la cantidad disponible
    if (!carVisible) {
      body.classList.add('active');
    }

    if (listCards[key] == null) {
        // Copia el producto de la lista a la lista de la tarjeta
        listCards[key] = JSON.parse(JSON.stringify(products[key]));
        listCards[key].quantity = 1;
        // Incrementa el precio total
        listCard.totalPrice += listCards[key].price;
    } else {
        //En caso de que sobrepase la cantidad disponible
        if (listCards[key].quantity >= products[key].quantity || listCards[key].quantity >= 5) {
          return reloadCard();
        }
        // Si el producto ya está en la tarjeta, incrementa la cantidad y el precio total en consecuencia
        listCards[key].quantity++;
        listCards[key].price += products[key].price;
    }
    reloadCard();
}

function changeQuantity(key, quantity) {
  if (quantity > products[key].quantity || quantity > 5) {
    return reloadCard();
  }
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

function loadProductsSaves(key, quantity) {
  listCards[key] = JSON.parse(JSON.stringify(products[key]));
  listCards[key].quantity = quantity;
  listCards[key].price = listCards[key].price * quantity
  listCard.totalPrice += listCards[key].price;
  return reloadCard()
}


//Funciones ajax
function obtenerCSRFToken() {
  // Obtiene el token CSRF de las cookies
  const cookies = document.cookie.split(';');
  for (let i = 0; i < cookies.length; i++) {
      const cookie = cookies[i].trim();
      if (cookie.startsWith('csrftoken=')) {
          return cookie.split('=')[1];
      }
  }
  return null;
}

//Funciones ajax
function ejectFunctionAdd(inventory_id) {
  fetch(`/store/add/`, {
      method: 'POST',  // Puedes usar POST o GET según tus necesidades
      headers: {
          'X-CSRFToken': obtenerCSRFToken(), // Asegúrate de incluir el token CSRF si lo necesitas
      },
      body: JSON.stringify({
          inventory_id
      }),
  })
  .then(response => response.json())
  .then(data => {
      data
  })
  .catch(error => {
      console.error('Error:', error);
  });
}

//Funciones ajax
function ejectFunctionDel(inventory_id) {
  fetch(`/store/del/`, {
      method: 'POST',  // Puedes usar POST o GET según tus necesidades
      headers: {
          'X-CSRFToken': obtenerCSRFToken(), // Asegúrate de incluir el token CSRF si lo necesitas
      },
      body: JSON.stringify({
          inventory_id
      }),
  })
  .then(response => response.json())
  .then(data => {
      data
  })
  .catch(error => {
      console.error('Error:', error);
  });
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
        <div class="text-slide">$${value.price.toLocaleString()}</div>
        <div>
          <button onclick="changeQuantity(${key}, ${value.quantity - 1}); ejectFunctionDel(${value.id});"><i class="fa-solid fa-minus" group="addOrDelete"></i></button>
          <div class="count">${value.quantity}</div>
          <button onclick="changeQuantity(${key}, ${value.quantity + 1}); ejectFunctionAdd(${value.id});"><i class="fa-solid fa-plus" group="addOrDelete"></i></button>
          <input type='hidden' name='priceInput' value='${value.price}'>
          <input type='hidden' name='quantityInput' value='${value.quantity}'>
        </div>`;
      listCard.appendChild(newDiv);
    }
  });
  total.innerText = `$${totalPrice.toLocaleString()}`;
}

//Agregando listas ya guardadas en la base de datos
listCardsToLoad.forEach((element) => {
  quantity = Number(element.attributes.quantity.value)
  products.forEach((element2, key) => {
    if (element2.id == Number(element.attributes.id.value)) {
      return loadProductsSaves(key, quantity)
    }
  })
})