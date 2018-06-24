var recipe = {
  name: "midnight speedster",
  serves: 1,
  ingredients: [
    "packect of instant noodles",
    "water",
    "chilli powder"
  ]
  // instructions: []
};

console.log(recipe.name);
console.log(recipe.serves);
// console.log(recipe.ingredients);
// console.log(recipe.ingredients[0]);
// console.log(recipe.ingredients.join(" "));
// console.log(recipe.ingredients.join(", "));
// console.log(recipe.ingredients.join("\n"));
// console.log(recipe.ingredients.join(" - "));
// console.log(recipe.ingredients.join(" - ").length);
// console.log(recipe.ingredients.join(" - ").split(" - "));

recipe.ingredients.forEach(function(ingredient) {
  console.log(ingredient);
});


var books = [
  {
    title: "why's (poignant) Guide to Ruby",
    author: "why_",
    alreadyRead: true
  },
  {
    title: "Practical Object-Oriented Design in Ruby",
    author: "Sandi Metz",
    alreadyRead: false
  }
];

for (var index = 0; index < books.length; index++) {
  // console.log(books[index].title);

  var book = books[i];

  if (book.alreadyRead) {
    console.log('you already read ' + book.title);
  } else {
    console.log('you may want to read ' + book.title);
  }
}

// if ([]) {
//   console.log('yay');
// }

// if ('') {
//   console.log('yay');
// }

// var myName;

// if (myName) {
//   console.log('yay');
// }

var film = {
  title: 'sharknado',
  duration: 300,
  stars: ['sharks', 'that guy from 90210']
};

// var blender = Math.random;
// blender;
// blender();

// var movieInfo = function() {
//   // var info =
//   // console.log('printing movie info');
//   console.log(movie.title + '');
// };
// movieInfo;
// movieInfo();

var movieInfo = function(movie) { // parameter
  // console.log(movie); // Throws no error
  // console.log(movie.title);
  // return movie.title;
  return movie.title + 'lasts for ' + movie.duration + ' minutes stars ' + movie.stars.join(', ');
};
// movieInfo(film);
console.log( movieInfo(film) );

// f(x)
