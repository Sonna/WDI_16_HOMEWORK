var library = [
  {
    title: 'Harry Potter',
    author: 'JK Rowling',
    price: 25,
    units: 18
  },
  {
    title: 'The Lion, the Witch and the Wardrobe',
    author: 'CS Lewis',
    price: 12.5,
    units: 2
  },
  {
    title: 'Winnie the Pooh',
    author: 'AA Milne',
    price: 15,
    units: 18
  },
  {
    title: 'The Oxford Dictionary',
    author: 'Oxford',
    price: 49.99,
    units: 1
  }
];

var basket = []

// basket.push(library[0]);

// var addToBasket = function(bookIndex) {
//   basket.push(library[bookIndex]);
// }

// basket.push('Harry potter');
basket.push('Harry Potter');
basket.push('Winnie the Pooh');
// console.log(basket); // => ["Harry Potter", "Winnie the Pooh"] (2)
basket.push('The Oxford Dictionary');

// var totalPrice = 25 + 15;
var totalPrice = 0;

for (var i = 0; i < library.length; i++) {
  if (library[i].title === basket[0]) {
    totalPrice = totalPrice + library[i].price;
  }
  if (library[i].title === basket[1]) {
    totalPrice = totalPrice + library[i].price;
  }
  if (library[i].title === basket[2]) {
    totalPrice = totalPrice + library[i].price;
  }
}
console.log(totalPrice); // => 40

//

var totalPrice = 0;

for (var i = 0; i < library.length; i++) {
  for (var j = 0; j < basket.length; j++) {
    // if (library[i].title.toLowerCase() === basket[j].toLowerCase()) {
    if (library[i].title === basket[j]) {
      totalPrice = totalPrice + library[i].price;
    }
  }
}
console.log(totalPrice.toFixed(2));

//

var totalPrice = 0;

library.forEach(function(book) {
  basket.forEach(function(item) {
    if (book.title === item) {
      totalPrice = totalPrice + book.price;
    }
  })
})
console.log(totalPrice.toFixed(2));

//

var totalPrice = 0;

for (var i = 0; i < basket.length; i++) {
  for (var j = 0; j < library.length; j++) {
    var item = basket[i];
    var book = library[j];

    if (item === book.title) {
      totalPrice += book.price;
      library[j].units--;
    }
  }
}
console.log(totalPrice.toFixed(2));

//

var findBook = function(title) {
  return library.find(function(book) { return book.title === title });
};
// console.log(findBook('Harry Potter'));

var findBookIndex = function(title) {
  return library.findIndex(function(book) { return book.title === title });
};
// console.log(findBookIndex('Harry Potter'));
