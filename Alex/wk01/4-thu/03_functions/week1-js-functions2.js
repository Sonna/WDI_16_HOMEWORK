// ---
// source:
// - title: week1-js-functions2.js
//   url: https://gist.github.com/epoch/fd1060cc1ca3502fab1c#file-week1-js-functions2-js
// ---

// 1. Build your own concatenation
// Write a function named combineWords that:
// - return a new string that is the combination of the two parameters
// Example: combineWords('dog', 'house') => 'doghouse'

function combineWords(word1, word2) {
  // TODO: Place your code here
  return word1 + word2;
}
var result = combineWords('dog', 'house');
console.log(result);
// displays 'doghouse'

// 2. Write a function named calculateAge that:
// - takes 2 arguments: birth year, current year.
// - calculates the 2 possible ages based on those years.
// outputs the result to the screen like so: "You are either 100 or 101"
// - Call the function three times with different sets of values.

// your code here
var calculateAge = function(birthYear, currentYear) {
  var age = currentYear - birthYear;
  var ageBeforeBirthday = age - 1;

  console.log("You are either " + age + " or " + ageBeforeBirthday);
}
calculateAge(1990, 2018);
// => "You are either 28 or 27"

//  3. Write a function `lengths` that accepts a single parameter as an argument, namely
// an array of strings. The function should return an array of numbers where each
// number is the length of the corresponding string.

// your code here
var lengths = function(words) {
  // return words.map((word) => word.length);

  var counts = [];

  words.forEach(function (word) {
    counts.push(word.length);
  });

  // Or
  //
  // for (var i = 0; i < words.length; i++) {
  //   counts.push(words[i].length);
  // }

  return counts;
};
console.log(lengths(["dog", "house"]));
// => [3, 5]

// 4. Write a Javascript function called `transmogrifier`
// This function should accept three arguments, which you can assume will be numbers.
// Your function should return the "transmogrified" result
//
// The transmogrified result of three numbers is the product of the first two numbers,
// raised to the power of the third number.

// your code here
var transmogrifier = function(a, b, c) {
  return (a * b) ** c;
};
console.log(transmogrifier(1, 2, 3));
// => 8

// 5. Write a function `wordReverse` that accepts a single argument, a string. The
// method should return a string with the order of the words reversed. Don't worry
// about punctuation.
// Example: wordReverse('we are good friends') => 'friends good are we'

// your code here
var wordReverse = function(word) {
  return word.split('').reverse().join('');
};
console.log(wordReverse('hello'));
// => 'olleh'
