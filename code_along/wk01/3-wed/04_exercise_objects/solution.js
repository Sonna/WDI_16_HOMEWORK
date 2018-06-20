// ---
// source:
// - title: week1-js-objects.md
//   url: https://gist.github.com/epoch/04ab1bc291a5f3ff79de#file-week1-js-objects-md
// ---

// # Exercises: Objects

// ## The Recipe Card

// Never forget another recipe!

// Create an object to hold information on your favorite recipe. It should have
// properties for title (a string), servings (a number), and ingredients (an
// array of strings).
var recipe = {
  title: "",
  servings: 0,
  ingredients: []
};

// On separate lines (one console.log statement for each), log the recipe
// information so it looks like:
var recipe = {
  title: "Mole",
  servings: 2,
  ingredients: ["cinnamon", "cumin", "cocoa"]
}

// - Mole
console.log("- " + recipe.title);
// - Serves: 2
console.log("- Serves: " + recipe.servings);
// - Ingredients:
console.log("- Ingredients: ");
// - cinnamon
console.log("- " + recipe.ingredients[0]);
// - cumin
console.log("- " + recipe.ingredients[1]);
// - cocoa
console.log("- " + recipe.ingredients[2]);

// ## The Reading List

// Keep track of which books you read and which books you want to read!

// Create an array of objects, where each object describes a book and has
// properties for the title (a string), author (a string), and alreadyRead (a
// boolean indicating if you read it yet).
var books = [
  {
    title: "The Hobbit",
    author: "J.R.R. Tolkien",
    alreadyRead: false
  },
  {
    title: "The Witcher",
    author: "Andrzej Sapkowski",
    alreadyRead: true
  }
]

// Iterate through the array of books. For each book, log the book title and
// book author like so: "The Hobbit by J.R.R. Tolkien".
books.forEach(function(book) {
  console.log(book.title + " by " + book.author);
});

// Now use an if/else statement to change the output depending on whether you
// read it yet or not. If you read it, log a string like 'You already read "The
// Hobbit" by J.R.R. Tolkien', and if not, log a string like 'You still need to
// read "The Lord of the Rings" by J.R.R. Tolkien.'
books.forEach(function(book) {
  if (book.alreadyRead) {
    console.log('You already read "' + book.title + '" by ' + book.author);
  } else {
    console.log('You still need to read "' + book.title + '" by ' + book.author);
  }
});

// ## The Movie Database

// It's like IMDB, but much much smaller!

// Create an object to store the following information about your favorite
// movie: title (a string), duration (a number), and stars (an array of
// strings).
var movie = {
  title: "",
  duration: 0,
  stars: []
};

// Create a function to print out the movie information like so: "Puff the Magic
// Dragon lasts for 30 minutes. Stars: Puff, Jackie, Living Sneezes."
var puffMovie = {
  title: "Puff the Magic Dragon",
  duration: 30,
  stars: ["Puff", "Jackie", "Living Sneezes"]
}

function movieInfo(movie) {
  console.log(movie.title + " lasts for " + movie.duration + " minutes. Stars: " + movie.stars.join(', ') + ".");
}
movieInfo(puffMovie);
