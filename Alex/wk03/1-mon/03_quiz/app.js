// First Button
var headingOnes = document.querySelectorAll('h1');
var headingButton = document.querySelector('.box button');

headingOnes.forEach(function(headingOne) {
  headingOne.classList.add('hidden');
})

headingButton.addEventListener('click', function() {
  if (headingOnes[0].classList.contains('hidden')) {
    headingOnes[0].classList.remove('hidden');
    headingOnes[1].classList.add('hidden');
  } else {
    headingOnes[0].classList.add('hidden');
    headingOnes[1].classList.remove('hidden');
  }
});

// Second Button
var buttons = document.querySelectorAll('button');
buttons.forEach(function(button) {
  if (button.textContent == 'Dont click me') {
    button.setAttribute('disabled', true);
  }
});

// Focus Inputs
var favouriteColour = '';
var leastFavouriteColour = '';
var favouriteFood = '';

var favColor = document.querySelector('#fav-color');
var leastFavColor = document.querySelector('#least-fav-color');
var favFood = document.querySelector('#fav-food');

var shoppingList = document.querySelectorAll('.shopping-list li');

var updateShoppingList = function() {
  shoppingList.forEach(function(item) {
    if (item.textContent === favouriteFood) {
      item.style.backgroundColor = favouriteColour;
    } else {
      item.style.backgroundColor = leastFavouriteColour;
    }
  });
}

favColor.addEventListener('blur', function() {
  // shoppingList
  favouriteColour = favColor.value;
  updateShoppingList();
});

leastFavColor.addEventListener('blur', function() {
  // shoppingList
  leastFavouriteColour = leastFavColor.value;
  updateShoppingList();
});

favFood.addEventListener('blur', function() {
  // shoppingList
  favouriteFood = favFood.value;
  updateShoppingList();
});


// Lucky Numbers
var drawBtn = document.querySelector('.draw-btn');
var luckyNumbers = document.querySelectorAll('.lucky-numbers li');

var hideLuckyNumbers = function() {
  luckyNumbers.forEach(function(luckyNumber) {
    luckyNumber.classList.add('hidden');
  });
};
hideLuckyNumbers();

drawBtn.addEventListener('click', function() {
  var randomNumber = Math.floor(Math.random() * luckyNumbers.length)
  hideLuckyNumbers();
  luckyNumbers[randomNumber].classList.remove('hidden');
});
