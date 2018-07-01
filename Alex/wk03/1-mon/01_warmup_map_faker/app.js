// ----
// source:
// - title: WDI Map Faker Warmup
//   url: https://gist.github.com/kasun-maldeni/a54a21c56ac930d8069e191c2af7cb80
// ----

var makeFakeMap = function() {}; // function-stub

// # Time to fool some archaeologists

// You are a villain trying to trap an adventuring archaeologist. Write a
// function 'makeFakeMap' that takes two numbers as arguments and returns an
// array of arrays to represent a map. It should be filled with the 'A'
// character, except for one, which should be an uppercase X(as below). The
// position of X should be determined randomly.

// ```javascript

makeFakeMap(5, 5);

// Sample outputs:

[
["A","A","A","A","A"],
["A","A","A","A","A"],
["A","A","X","A","A"],
["A","A","A","A","A"],
["A","A","A","A","A"]
];

makeFakeMap(5, 5);

[
["A","A","A","A","A"],
["A","A","A","A","A"],
["A","A","A","A","A"],
["A","A","A","A","X"],
["A","A","A","A","A"]
];

makeFakeMap(5, 5);

[
["A","A","A","A","A"],
["A","A","A","X","A"],
["A","A","A","A","A"],
["A","A","A","A","A"],
["A","A","A","A","A"]
];

// ```

var makeFakeMap = function(height, width, markChar) {
  // Default arguments
  height = (typeof height !== 'undefined') ? height : 5;
  width = (typeof width !== 'undefined') ? width : 5;
  markChar = (typeof markChar !== 'undefined') ? markChar : 'X';

  var fillerChar = 'A';

  var fakeMapRows = new Array(width);
  var fakeMap = new Array(height);
  fakeMapRows.fill(fillerChar);
  fakeMap.fill(fakeMapRows);

  // Mark the spot randomly
  var x = Math.floor(Math.random() * width);
  var y = Math.floor(Math.random() * height);

  fakeMap[y][x] = markChar;

  return fakeMap;
};

console.log(makeFakeMap(5, 5));
console.log(makeFakeMap(5, 5));
console.log(makeFakeMap(5, 5));

// ### Bonus 1

// Modify your function to take a third key argument and generate maps with a
// single key character inserted randomly.

// ```javascript

//bonus output:

makeFakeMap(5, 5, 'F');

[
["A","A","A","A","A"],
["A","A","A","A","A"],
["A","F","A","A","A"],
["A","A","A","A","A"],
["A","A","A","A","A"]
];

// ```


// ### Bonus 2

// Modify your function to generate maps with 'regions' that you can control.
// The regions you should support are below:

// F: generate a forest
// W: generate a body of water
// D: generate a desert region

// The argument after the region should be the size of that region. For example,
// region size 2 would make a 2x2 region within your map (placed randomly) __in
// which one of the tiles is the treasure marker, X__. Inspect the sample output
// below. The Region size argument should not be allowed to be bigger than the
// map itself.

// ```javascript

//bonus 2 output:

makeFakeMap(5, 5, 'F', 2, 'X');

[
["A","A","A","A","A"],
["A","A","A","A","A"],
["A","A","F","X","A"],
["A","A","F","F","A"],
["A","A","A","A","A"]
];

// ```
