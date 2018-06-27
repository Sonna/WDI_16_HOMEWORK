// ---
// source:
// - title: money_tree.md
//   url: https://gist.github.com/epoch/16fe7e406bdc23da03df747211c8112f#file-money_tree_screen_shot-png
// ---


// # Money Tree

var moneyTree = function(size, symbol, padding) {
  size = (typeof size !== 'undefined') ? size : 7;
  symbol = (typeof symbol !== 'undefined') ? symbol : "$";
  padding = (typeof padding !== 'undefined') ? padding : " ";

  if (size === 1) {
    return [symbol];
  }

  var lines = [];

  // 2n +1

  // last line first
  // lines.push(symbol.repeat((2 * size) + 1))

  // // second-last line first
  // lines.push(padding + symbol.repeat((2 * (size - 1)) + 1) + padding)

  // // third-last line first
  // lines.push(padding.repeat(2) + symbol.repeat((2 * (size - 2)) + 1) + padding.repeat(2))

  for (var i = 0; i <= size; i++) {
    var line = padding.repeat(i) + symbol.repeat((2 * (size - i)) + 1) + padding.repeat(i);
    lines.push(line);
  }

  return lines.reverse();
};

var logMoneyTree = function(size, symbol) {
  var tree = moneyTree(size, symbol);
  tree.forEach(function(line) { console.log(line); });
}

logMoneyTree(7);
