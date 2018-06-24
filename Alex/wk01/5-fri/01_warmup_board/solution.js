// ---
// source:
// - title: WDI The Board Warmup
//   url: https://gist.github.com/kasun-maldeni/7787ab81d02477be49565381f78412cf
// ---

// # The Board

// Write a program that creates a string that represents an 8×8 grid, using new-
// line characters to separate lines. At each position of the grid there is
// either a space or a “#” character. The characters should form a chess board.

// Passing this string to console.log should show something like this:

// ```shell
// # # # # # # # #
//  # # # # # # # #
// # # # # # # # #
//  # # # # # # # #
// # # # # # # # #
//  # # # # # # # #
// # # # # # # # #
//  # # # # # # # #
// ```

var createBoard = function(size, symbol) {
  size = (typeof size !== 'undefined') ? size : 8; // default to size 8
  symbol = (typeof symbol !== 'undefined') ? symbol : '#';

  if (size === 1) {
    return symbol + '\n';
  }

  var evenRowPattern = symbol + ' ';
  var oddRowPattern = ' ' + symbol;
  // var halfSize = Math.floor(size / 2);
  var result = '';

  for (var i = 0; i < size; i++) {
    if (i % 2 === 0) {
      result += evenRowPattern.repeat(size);
    } else {
      result += oddRowPattern.repeat(size);
    }
    result += '\n';
  }

  return result;
}

console.log('Create a Board, when given no values');
console.log(createBoard());

// ### Extension

// When you have a program that generates this pattern, define a variable `size
// = 8` and change the program so that it works for any size, outputting a grid
// of the given width and height. Then, define a variable `symbol` that
// generates the board using the specified character instead.

console.log('Create a Board size 1:');
console.log(createBoard(1));

console.log('Create a Board size 2:');
console.log(createBoard(2));

console.log('Create a Board size 4, with symbol @:');
console.log(createBoard(4, '@'));

var gridSize = 8;
var gridSymbol = '#';

if (typeof prompt !== 'undefined') {
  gridSize = prompt("Please define a size of the grid:", gridSize);
  gridSymbol = prompt("Please define a symbol to use in grid:", gridSymbol);

  console.log('Create a Board size ' + gridSize + ', with symbol ' + gridSymbol + ':');
  console.log(createBoard(gridSize, gridSymbol));
}
else {
  const readline = require('readline');
  const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
  });

  const sizeQuestion = () => {
    return new Promise((resolve, reject) => {
      rl.question('Please define a size of the grid: ', (answer) => {
        resolve(answer);
      });
    });
  };

  const symbolQuestion = () => {
    return new Promise((resolve, reject) => {
      rl.question('Please define a symbol to use in grid: ', (answer) => {
        resolve(answer);
      });
    });
  };

  function timeout(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
  }

  const askQuestions = async () => {
    await timeout(1000); // Artificial wait, to not have to add async code above
    gridSize = await sizeQuestion();
    gridSymbol = await symbolQuestion();

    console.log('Create a Board size ' + gridSize + ', with symbol ' + gridSymbol + ':');
    console.log(createBoard(gridSize, gridSymbol));

    rl.close();
  }

  askQuestions();
}
