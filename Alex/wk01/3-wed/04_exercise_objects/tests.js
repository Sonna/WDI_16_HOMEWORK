QUnit.test( "hello test", function( assert ) {
  assert.ok( 1 == "1", "Passed!" );
});

// == References:
// - [QUnit]
//   (http://qunitjs.com/)
QUnit.test( "hello test", function( assert ) {
  assert.ok( 1 == "1", "Passed!" );
});

var recipe = {
  title: "Mole",
  servings: 2,
  ingredients: ["cinnamon", "cumin", "cocoa"]
}

QUnit.test("recipe has expected title", function(assert) {
  assert.equal(recipe.title, "Mole");
});

QUnit.test("recipe has expected servings", function(assert) {
  assert.equal(recipe.servings, 2);
});

QUnit.test("recipe has expected ingredients", function(assert) {
  assert.deepEqual(recipe.ingredients, ["cinnamon", "cumin", "cocoa"]);
});

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

QUnit.test("first book has expected title", function(assert) {
  assert.equal(books[0].title, "The Hobbit");
});

QUnit.test("first book has expected author", function(assert) {
  assert.equal(books[0].author, "J.R.R. Tolkien");
});

QUnit.test("first book has expected alreadyRead status", function(assert) {
  assert.notOk(books[0].alreadyRead, "Has already been read!");
});

QUnit.test("second book has expected title", function(assert) {
  assert.equal(books[1].title, "The Witcher");
});

QUnit.test("second book has expected author", function(assert) {
  assert.equal(books[1].author, "Andrzej Sapkowski");
});

QUnit.test("second book has expected alreadyRead status", function(assert) {
  assert.ok(books[1].alreadyRead, "Has NOT already been read!");
});

var movie = {
  title: "Puff the Magic Dragon",
  duration: 30,
  stars: ["Puff", "Jackie", "Living Sneezes"]
}

QUnit.test("movie has expected title", function(assert) {
  assert.equal(movie.title, "Puff the Magic Dragon");
});

QUnit.test("movie has expected duration", function(assert) {
  assert.equal(movie.duration, 30);
});

QUnit.test("movie has expected stars", function(assert) {
  assert.deepEqual(movie.stars, ["Puff", "Jackie", "Living Sneezes"]);
});

QUnit.test("movie has expected stars", function(assert) {
  assert.deepEqual(movie.stars, ["Puff", "Jackie", "Living Sneezes"]);
});

// == References:
// - [QUnit]
//   (http://qunitjs.com/)
//
// - [deepEqual | QUnit API Docs]
//   (https://api.qunitjs.com/assert/deepEqual)
