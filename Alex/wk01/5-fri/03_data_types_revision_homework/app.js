// ---
// source:
// - title: js_data_types_revision_homework.md
//   url: https://gist.github.com/epoch/202871ec7120fa9e985f0acc07e64f62#file-js_data_types_revision_homework-md
// ---

// # Javascript Data Types Exercises

// > This worksheet will double as Javascript notes for future reference! Copy
// > it into your preferred note-taking program at the end of class.

// ## Data Types

// For each expression, predict what you think the output will be in a comment
// (`//`) ***without first running the command***. Then run the expression in
// the console. Note the actual output in a comment and compare it with your
// prediction.

// #### Example

// ```js
// typeof "potato"
// // Prediction: Vegetable
// // Actual: String
// ```

// What is the output of each of the expressions below?

// ```js
typeof 15
// Prediction: Number
console.log(typeof 15);
// Actual: number

typeof 5.5
// Prediction: Number
console.log(typeof 5.5);
// Actual: number

typeof NaN
// Prediction: Number
console.log(typeof NaN);
// Actual: number

typeof "hello"
// Prediction: String
console.log(typeof "hello");
// Actual: string

typeof true
// Prediction: Boolean
console.log(typeof true);
// Actual: boolean

typeof 1 != 2
// Prediction: Boolean
console.log((typeof 1 != 2));
// Actual: true


"hamburger" + "s"
// Prediction: "hamburgers"
console.log("hamburger" + "s");
// Actual: "hamburgers"

"hamburgers" - "s"
// Prediction: `undefined method - for String`
console.log("hamburger" - "s");
// Actual: NaN

"1" + "3"
// Prediction: "13"
console.log("1" + "3");
// Actual: "13"

"1" - "3"
// Prediction: error `undefined method - for String`
console.log("1" - "3");
// Actual: -2
// Really? It returns a `number`, <sigh>.

"johnny" + 5
// Prediction: "johnny5"
console.log("johnny" + 5);
// Actual: "johnny5"

"johnny" - 5
// Prediction: error `undefined method - for String`
console.log("johnny" - 5);
// Actual: NaN

99 * "luftbaloons"
// Prediction: error `undefined conversion for String to type number`
console.log(99 * "luftbaloons");
// Actual: NaN
// ```

// ### Arrays

// Javascript provides us with a number of native methods that allow us to
// interact with arrays. Find methods that do each of the following and provide
// an example...
// * Add an element to the back of an array.
// * Remove an element from the back of an array.
// * Add an element to the front of an array.
// * Remove an element from the front of an array.
// * Concatenates all the elements in an array into a string.
// * Separates the characters of a string into an array. This one is a string
//   method.

// > This is a great exercise for practicing your "Google Fu"! If you need a
// > starting point, check out [MDN's documentation page on
// > arrays](https://developer.mozilla.org/en-
// > US/docs/Web/JavaScript/Reference/Global_Objects/Array).

// ```js
// Your answers go here.
var myArray = [];

// * Add an element to the back of an array.
myArray.push(1);

// * Remove an element from the back of an array.
myArray.pop();

// * Add an element to the front of an array.
myArray.shift("hello");

// * Remove an element from the front of an array.
myArray.unshift();

// * Concatenates all the elements in an array into a string.
myArray = ["hello", " ", "world", "!"];
myArray.join(''); // => "hello world!"

// * Separates the characters of a string into an array. This one is a string
//   method.
"hello world!".split('')
// => ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d", "!"]

// ```

// What will the contents of the below arrays be after the code samples are
// executed? Come up with an answer yourself before testing it out in the
// console.

// ```js
var numbers = [2, 4, 6, 8]
numbers.pop()
numbers.push(10)
numbers.unshift(3)
// ```

// ```text
// Your answer goes here.
var numbers = [2, 4, 6, 8];
console.log(numbers);
// Prediction: [2, 4, 6, 8]
// Actual: [2, 4, 6, 8]

numbers.pop()
console.log(numbers);
// Prediction: [2, 4, 6]
// Actual: [2, 4, 6]

numbers.push(10)
console.log(numbers);
// Prediction: [2, 4, 6, 10]
// Actual: [2, 4, 6, 10]

numbers.unshift(3)
console.log(numbers);
// Prediction: [10]
// Actual: [3, 2, 4, 6, 10]
// Oops, misread `unshift` as `shift` and assumed it took an optional argument
// `n` to preform its operation `n` number of times.

// ```

// What is the return value of the below code sample? Come up with an answer
// yourself before testing it out in the console.

// ```js
var morse = ["dot", "pause", "dot"]
var moreMorse = morse.join(" dash ")
moreMorse.split(" ")
// ```

// ```text
// Your answer goes here.
var morse = ["dot", "pause", "dot"]
console.log(morse);
// Prediction: ["dot", "pause", "dot"]
// Actual: ["dot", "pause", "dot"]

var moreMorse = morse.join(" dash ")
console.log(moreMorse);
// Prediction: "dot dash pause dash dot"
// Actual: "dot dash pause dash dot"

moreMorse.split(" ")
console.log(moreMorse.split(" "));
// Prediction: ["dot", "dash", "pause", "dash", "dot"]
// Actual: ["dot", "dash", "pause", "dash", "dot"]

// ```

// What will the contents of the below array be after the below code sample is
// executed? Come up with an answer yourself before testing it out in the
// console.

// ```js
var bands = []
var beatles = ["Paul", "John", "George", "Pete"]
var stones = ["Brian", "Mick", "Keith", "Ronnie", "Charlie"]
bands.push(beatles)
bands.unshift(stones)
bands[bands.length - 1].pop()
bands[0].shift()
bands[1][3] = "Ringo"
// ```

// ```text
// Your answer goes here.
var bands = []
console.log(bands);
// Prediction: []
// Actual: []

var beatles = ["Paul", "John", "George", "Pete"]
console.log(beatles);
// Prediction: ["Paul", "John", "George", "Pete"]
// Actual: ["Paul", "John", "George", "Pete"]

var stones = ["Brian", "Mick", "Keith", "Ronnie", "Charlie"]
console.log(stones);
// Prediction: ["Brian", "Mick", "Keith", "Ronnie", "Charlie"]
// Actual: ["Brian", "Mick", "Keith", "Ronnie", "Charlie"]

bands.push(beatles)
console.log(bands);
// Prediction: [ ["Paul", "John", "George", "Pete"] ]
// Actual: [Array(4)]
//         { 0: ["Paul", "John", "George", "Pete"] }

bands.unshift(stones)
console.log(bands);
// Prediction: [ ["Brian", "Mick", "Keith", "Ronnie", "Charlie"],
//               ["Paul", "John", "George", "Pete"] ]
// Actual: [Array(5), Array(4)]
//         { 0: ["Brian", "Mick", "Keith", "Ronnie", "Charlie"],
//           1: ["Paul", "John", "George", "Pete"] }

bands[bands.length - 1].pop()
console.log(bands);
// Prediction: [ ["Brian", "Mick", "Keith", "Ronnie", "Charlie"],
//               ["Paul", "John", "George"] ]
// Actual: [Array(5), Array(3)]
//         { 0: ["Brian", "Mick", "Keith", "Ronnie", "Charlie"],
//           1: ["Paul", "John", "George"] }

bands[0].shift()
console.log(bands);
// Prediction: [ ["Mick", "Keith", "Ronnie", "Charlie"],
//               ["Paul", "John", "George"] ]
// Actual: [Array(4), Array(3)]
//         { 0: ["Mick", "Keith", "Ronnie", "Charlie"],
//           1: ["Paul", "John", "George"] }

bands[1][3] = "Ringo"
console.log(bands);
// Prediction: [ ["Mick", "Keith", "Ronnie", "Charlie"],
//               ["Paul", "John", "George", "Ringo"] ]
// Actual: [Array(4), Array(4)]
//         { 0: ["Mick", "Keith", "Ronnie", "Charlie"],
//           1: ["Paul", "John", "George", "Ringo"] }
// ```

// ## Booleans & Comparison Operators

// Here's an example truth table for the `!` (not) operation. In it, we're
// listing the values of `!a` that correspond with a given value of `a`.

// |  a  |  !a |
// | --- | --- |
// | true|false|
// |false| true|

// Fill out the truth tables below for `&&` (and), `||` (or) and one that uses
// multiple comparison operators. All you need to do is replace the `?`'s with
// either `true` or `false`.

// > **NOTE:** Because of markdown formatting, `||` and `&&` have been replaced
// > with `OR` and `AND` respectively.
// >
// > **HINT:** With the last one, it may be helpful to add additional columns to
// > the table for each individual comparison.

// |   a   |   b   | a AND b |
// | ----- | ----- | ------- |
// |  true |  true |    true |
// |  true | false |   false |
// | false |  true |   false |
// | false | false |   false |

// |   a   |   b   | a OR b |
// | ----- | ----- | ------ |
// |  true |  true |   true |
// |  true | false |   true |
// | false |  true |   true |
// | false | false |  false |

// |  a  |  b  | a `!=` b |
// | --- | --- | -------- |
// |   3 |   3 |    false |
// |   1 |   5 |     true |
// |   2 | "2" |    false |

// |   a   |   b   | !a AND (a OR b)|
// | ----- | ----- | -------------- |
// |  true |  true |          false |
// |  true | false |          false |
// | false |  true |           true |
// | false | false |          false |

// ## Conditionals

// You're a bouncer at a bar. Given an `age` variable, create a conditional that
// satisfies the following requirements...
// * If a patron is older than `21`, print out `"Come on in!"`.
// * If a patron is between `18` and `21`, print out `"Come on in (but no
//   drinking)!"`.
// * If a patron is younger than 18, print out `"You're too young to be in
//   here!"`.
// * If a patron is older than 75, print out `"Are you sure you want to be
//   here?"`.

// ```js
// Your answer goes here.
var age = 18;

if (age > 75) {
  console.log("Are you sure you want to be here?");
} else if (age > 21) {
  console.log("Come on in!");
} else if (age >= 18 && age <= 21) {
  console.log("Come on in (but no drinking)!");
} else if (age < 18) {
  console.log("You're too young to be in here!");
}
// ```

// #### Bonus

// Bar patrons must have an ID if the bouncer is even going to consider what age
// they are.
// - If the patron has an ID, the bouncer will then check if they are of the
//   proper age
// - If the patron does not have an ID, the bouncer will tell them `"No ID, no
//   entry."`

// > Hint: Whether the patron has an ID or not can be stored in a `hasId`
// > variable. What do you think the stored data type should be?

// ```js
// Your answer goes here.
var hasId = false;

if (hasId) {
  if (age > 75) {
    console.log("Are you sure you want to be here?");
  } else if (age > 21) {
    console.log("Come on in!");
  } else if (age >= 18 && age <= 21) {
    console.log("Come on in (but no drinking)!");
  } else if (age < 18) {
    console.log("You're too young to be in here!");
  }
} else {
  console.log("No ID, no entry.");
}

var patron = {
  age: 22,
  hasId: true
}

var bounce = function(possiblePatron) {
  if (possiblePatron.hasId) {
    if (possiblePatron.age > 75) {
      console.log("Are you sure you want to be here?");
    } else if (possiblePatron.age > 21) {
      console.log("Come on in!");
    } else if (possiblePatron.age >= 18 && possiblePatron.age <= 21) {
      console.log("Come on in (but no drinking)!");
    } else if (possiblePatron.age < 18) {
      console.log("You're too young to be in here!");
    }
  } else {
    console.log("No ID, no entry.");
  }
}
bounce(patron);
// ```

// ## Bonus: Fizz-Buzz

// Fizz-Buzz is a classic coding exercise that you can create using your
// knowledge of conditionals and loops. Implement code that does the
// following...
// * Counts from 1 to 100 and prints out something for each number.
// * If the number is divisible by 3, print `"Fizz"`.
// * If the number is divisible by 5, print `"Buzz"`.
// * If the number is divisible by both 3 and 5, print `"FizzBuzz"`.
// * If the number does not meet any of the above conditions, just print the
//   number.

// Your output should look something like this...

// ```text 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, Fizz
// Buzz, 16, 17, Fizz, 19, Buzz, Fizz, 22, 23, Fizz, Buzz, 26, Fizz, 28, 29,
// Fizz Buzz, 31, 32, Fizz, 34, Buzz, Fizz, ...
// ```

// ```js
// Your answer goes here.
var fizzBuzz = function(number) {
  if (number % 3 === 0 && number % 5 === 0) {
    return 'FizzBuzz';
  } else if (number % 3 === 0) {
    return 'Fizz';
  } else if (number % 5 === 0) {
    return 'Buzz';
  }
  return number;
};

for (var i = 1; i < 100; i++) {
  console.log(fizzBuzz(i));
}
// ```

// #### Bonus (for the bonus)

// * Encapsulate all of your logic into a function, so that each iteration of
//   the game will trigger function calls that look something like these...

// ```js
var fizzBuzz = function(number) {
  if (number % 3 === 0 && number % 5 === 0) {
    console.log('FizzBuzz');
  } else if (number % 3 === 0) {
    console.log('Fizz');
  } else if (number % 5 === 0) {
    console.log('Buzz');
  } else {
    console.log(number);
  }
};

fizzBuzz(1)
// => prints "1" to the console

fizzBuzz(3)
// => prints "3" to the console

fizzBuzz(15)
// => prints "FizzBuzz" to the console
// ```
