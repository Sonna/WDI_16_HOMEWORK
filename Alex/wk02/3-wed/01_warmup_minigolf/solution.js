// ---
// source:
// - title: WDI Minigolf Warmup
//   url: https://gist.github.com/kasun-maldeni/9f24ddbad63aecf72f017e704692e7c3
// ---

// # Mini Golf
//
// Bob, Jimbo and Fish love mini golf. But, every time they hand in their score
// cards none of the scores are ever totalled. Write a function called
// `totalScores` in JS that calculates their scores and `console.log` the total
// for each player and their combined total.

// #### Bob
var bobScores = [
// - Hole 1 = 3
  3,
// - Hole 2 = 2
  2,
// - Hole 3 = 6
  2,
// - Hole 4 = 11
  11,
// - Hole 5 = 9
  9,
// - Hole 6 = 2
  2,
// - Hole 7 = 6
  6,
// - Hole 8 = 9
  9,
// - Hole 9 = 10
  10
];


// #### Jimbo
var jimboScores = [
// - Hole 1 = 5
  5,
// - Hole 2 = 12
  12,
// - Hole 3 = 9
  9,
// - Hole 4 = 22
  22,
// - Hole 5 = 13
  13,
// - Hole 6 = 7
  7,
// - Hole 7 = 16
  16,
// - Hole 8 = 10
  10,
// - Hole 9 = 11
  11
];

// #### Fish
var fishScores = [
// - Hole 1 = 2
  2,
// - Hole 2 = 2
  2,
// - Hole 3 = 4
  4,
// - Hole 4 = 5
  5,
// - Hole 5 = 4
  4,
// - Hole 6 = 3
  3,
// - Hole 7 = 6
  6,
// - Hole 8 = 4
  4,
// - Hole 9 = 1
  1
];

var total = function(values) {
  return values.reduce(function(sum, value) { return sum += value; }, 0);
}

// == References:
// - [Array.prototype.reduce - JavaScript | MDN]
//   (https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reduce)

console.log("  Bob total: " + total(bobScores));
console.log("Jimbo total: " + total(jimboScores));
console.log(" Fish total: " + total(fishScores));

// ## Extension
// Now work out each golfers round compared to the course par.

// #### Par
var coursePar = [
// - Hole 1 = 3
  3,
// - Hole 2 = 4
  4,
// - Hole 3 = 5
  5,
// - Hole 4 = 5
  5,
// - Hole 5 = 3
  3,
// - Hole 6 = 3
  3,
// - Hole 7 = 4
  4,
// - Hole 8 = 3
  3,
// - Hole 9 = 5
  5
];

var golfScore = function(values, par) {
  return values.reduce(function(sum, value, index) {
    return sum += value - par[index];
  }, 0);
}

console.log("  Bob golf score: " + golfScore(bobScores, coursePar));
console.log("Jimbo golf score: " + golfScore(jimboScores, coursePar));
console.log(" Fish golf score: " + golfScore(fishScores, coursePar));

// #### Ninja Extension
//
// Fish loves a punt. Having placed a $1 bet on each stroke over par that Bob
// and Jimbo played per hole calculate his winnings.

// Ignore minus values?
var strokesOverPar = function(values, par) {
  return values.reduce(function(sum, value, index) {
    return sum += Math.max(0, value - par[index]);
  }, 0);
}

console.log("  Bob owes Fish: $" + strokesOverPar(bobScores, coursePar));
console.log("Jimbo owes Fish: $" + strokesOverPar(jimboScores, coursePar));

// == References:
// - [Javascript Math Object Methods - negatives to zero - Stack Overflow]
//   (https://stackoverflow.com/questions/4924842/javascript-math-object-methods-negatives-to-zero)