// ---
// source:
// - title: WDI Ruby Squares Warmup
//   url: https://gist.github.com/kasun-maldeni/51626fb1920dc1c4786c615cb0e0db39
// ---

// ## Ruby Squares!

// <!-- ![squares](http://i.giphy.com/x6F5Kp0hnZ2Fy.gif) -->
// ![squares](687474703a2f2f692e67697068792e636f6d2f783646354b7030686e5a3246792e676966.gif)


// A perfect square is defined as a whole number that when square rooted is a
// whole number (such as 1, 4, 9, 16, etc.).

// Make a new file called `get_squares.rb`.

// Write a method called `get_squares` that takes an argument, an array of
// numbers. This method will return a new array of numbers that qualify as
// perfect squares from the argument array.

// def get_squares(numbers)
//   numbers.each_with_object([]) do |number, result|
//     # result.push(number) if Math.sqrt(number) % 1 == 0
//     result.push(number) if Math.sqrt(number).modulo(1).zero?
//   end.uniq.sort
// end

// **NOTE:** The returned array of perfect squares should be in ascending order
// with no duplicates.

// ```ruby
// get_squares([4, 1, 16, 1, 10, 35, 22]) # => [1, 4, 16]
// ```

// ### Done?
// Solve it with a JavaScript function!

// Store your solution in a new file called `getSquares.js` and run it in the
// console.

var getSquares = function(numbers) {
  return numbers.reduce(function(results, number) {
    if (Math.sqrt(number) % 1 == 0 && !results.includes(number)) {
      results.push(number);
    }
    return results;
  }, []);
}


// **HINT:** Sorting an array of numbers with `.sort` in JS would produce the
// following...

// ```javascript
getSquares([4, 1, 16, 1, 10, 35, 22]); // => [ 1, 16, 4 ]
console.log(getSquares([4, 1, 16, 1, 10, 35, 22]));
// ```

// What's that all about?!?!?!

var getSquares = function(numbers) {
  return Array.from(new Set(numbers.filter(function(number) {
    return Math.sqrt(number) % 1 == 0;
  })));
}

// ```javascript
getSquares([4, 1, 16, 1, 10, 35, 22]); // => [ 1, 16, 4 ]
console.log(getSquares([4, 1, 16, 1, 10, 35, 22]));
// ```
