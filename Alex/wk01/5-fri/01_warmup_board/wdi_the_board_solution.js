// ---
// source:
// - title: WDI The Board Solution
//   url: https://gist.github.com/kasun-maldeni/7d130dbf50fc4bb1bde9eedb97fc3980
// ---

var rows = 8;
var columns = 8;
var symbol = '#';
var board = '';

for (var y = 0; y < rows; y++) {
  if (y % 2 === 0) {
    var pattern = symbol + ' ';
  } else {
    var pattern = ' ' + symbol;
  }
  board += pattern.repeat(columns) + '\n';
}

console.log(board);
