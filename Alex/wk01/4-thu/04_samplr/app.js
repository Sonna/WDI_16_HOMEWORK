console.log("Welcome to Samplr");

var students = [];
//   "Alex",
//   "Axel",
//   "Caroline",
//   "Elizabeth",
//   "Evan",
//   "Francesco",
//   "Inder",
//   "Jessie",
//   "Kate",
//   "Leah",
//   "Lin",
//   "Mark",
//   "Megan",
//   "Micael",
//   "Rachel",
//   "Renae",
//   "Tom",
//   "Tong"
// ];

students.length; // => 0
students.push("Kate"); // => 1
students; // => ["Kate"]
students.length; // => 1
students[0]; // => "Kate"

students.push("Mark"); // => 2
students; // => ["Kate", "Mark"]

students.pop(); // => "Mark"
students; // => ["Kate"]

students.pop(); // => "Kate"
students; // => []

students.push("Mark"); // => 1
students.push("Kate"); // => 2
students; // => ["Mark", "Kate"]
students.shift(); // => "Mark"
students; // => ["Kate"]

students.push("Tom"); // => 3
students; // => ["Mark", "Kate", "Tom"]
students.push("Inder"); // => 4
students; // => ["Mark", "Kate", "Tom", "Inder"]

//

var randomIndex = Math.floor(Math.random() * students.length);

// Investigate the following:
//
// ---
// source:
// - title: week01_array_string_methods.md
//   url: https://gist.github.com/epoch/4c33f43b7968d9d0541d3834e28c95fe#file-week01_array_string_methods-md
// ---

// # array methods

// - join
var elements = ['Fire', 'Wind', 'Rain'];

console.log(elements.join()); // => "Fire,Wind,Rain"
console.log(elements.join('')); // => "FireWindRain"
console.log(elements.join('-')); // => "Fire-Wind-Rain"

// - concat
var array1 = ['abc'];
var array2 = ['d', 'e', 'f'];

console.log(array1.concat(array2)); // => ["abc", "d", "e", "f"]

// - indexOf
var animals = ['duck', 'horse', 'sheep', 'duck'];

console.log(animals.indexOf('duck')); // => 0

// start from index 2
console.log(animals.indexOf('duck', 2)); // => 3

console.log(animals.indexOf('goose')); // => -1

// - pop
// - push
// - shift
// - unshift
// - slice
// - reverse
// - splice

// - forEach
var array1 = ['duck', 'duck', 'goose'];

array1.forEach(function(element) {
  console.log(element);
});
// =>
//   "duck"
//   "duck"
//   "goose"

array1.forEach(function(element, index) {
  if (element === "goose") {
    console.log("Found 'Goose' at index: " + index);
  } else {
    console.log(element);
  }
});
// =>
//   "duck"
//   "duck"
//   "Found 'Goose' at index: 2"

// # string methods

// - split
"Hello World!".split('')
// => (12) ["H", "e", "l", "l", "o", " ", "W", "o", "r", "l", "d", "!"]

"Hello World!".split('', 5)
// => (5) ["H", "e", "l", "l", "o"]

"Hello World!".split(/[^A-Za-z]/)
// => ["Hello", "World", ""]

"Hello World!".split(/[^A-Za-z]/, 2)
// => ["Hello", "World"]

"Hello World!".split('').reverse().join(''); // => "!dlroW olleH"

// - slice
// - indexOf
// - substring
// - substr
var aString = 'Mozilla';

console.log(aString.substr(0, 1));   // => 'M'
console.log(aString.substr(1, 0));   // => ''
console.log(aString.substr(-1, 1));  // => 'a'
console.log(aString.substr(1, -1));  // => ''
console.log(aString.substr(-3));     // => 'lla'
console.log(aString.substr(1));      // => 'ozilla'
console.log(aString.substr(-20, 2)); // => 'Mo'
console.log(aString.substr(20, 2));  // => ''

// - replace
// - match
// - search
var str = "<p>Hello World!</p>";
var innerTextRegEx = /(?<=(<p>))(.*)(?=(<\/p>))/g;

console.log(str.search(innerTextRegEx)); // => 3

// ```javascript
//   ['lord buckethead', 'elmo', 'theresa may', 'mr fish finger']
// ```

// == References:
// - [Array.prototype.join - JavaScript | MDN]
//   (https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/join)
//
// - [Array.prototype.concat - JavaScript | MDN]
//   (https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/concat)
//
// - [Array.prototype.indexOf - JavaScript | MDN]
//   (https://developer.mozilla.org/)
//
// - [Array.prototype.forEach - JavaScript | MDN]
//   (https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach)
//
// - [String.prototype.substr - JavaScript | MDN]
//   (https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/substr)
//
// - [String.prototype.search - JavaScript | MDN]
//   (https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/search)
