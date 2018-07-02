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

var buildFakeMapRow = function(width, value) {
  return new Array(width).fill(value);
}

var buildInitialFakeMap = function(height, width, value) {
  var map = []
  for (var i = 0; i < height; i++) {
    map.push(buildFakeMapRow(width, value));
  }
  return map;
}

// Mark the spot randomly
var generate2DCoordinate = function(height, width) {
  var x = Math.floor(Math.random() * width);
  var y = Math.floor(Math.random() * height);

  return { x: x, y: y };
}

var markMap = function(map, marking, coordinate, amount) {
  amount = (typeof amount !== 'undefined') ? amount : 1;

  var height = map.length;
  var width = map[0].length;

  for (var i = 0; i < amount; i++) {
    for (var j = 0; j < amount; j++) {
      if (coordinate.y + i < height && coordinate.x + j < width) {
        map[coordinate.y + i][coordinate.x + j] = marking;
      }
    }
  }
}

var makeFakeMap = function(height, width, markChar) {
  // Default arguments
  height = (typeof height !== 'undefined') ? height : 5;
  width = (typeof width !== 'undefined') ? width : 5;
  markChar = (typeof markChar !== 'undefined') ? markChar : 'X';

  var fillerChar = 'A';

  var fakeMap = buildInitialFakeMap(height, width, fillerChar);
  markMap(fakeMap, markChar, generate2DCoordinate(height, width));

  return fakeMap;
};

console.log(makeFakeMap(5, 5).join('\n'));
console.log(makeFakeMap(5, 5).join('\n'));
console.log(makeFakeMap(5, 5).join('\n'));

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

// Unused idea :/
// const dict = arr => Object.assign(...arr.map( ([k, v]) => ({[k]: v}) ));

var buildFakeMapRow = function(width, value) {
  return new Array(width).fill(value);
}

var buildInitialFakeMap = function(height, width, value) {
  var map = []
  for (var i = 0; i < height; i++) {
    map.push(buildFakeMapRow(width, value));
  }
  return map;
}

// Mark the spot randomly
var generate2DCoordinate = function(height, width) {
  var x = Math.floor(Math.random() * width);
  var y = Math.floor(Math.random() * height);

  return { x: x, y: y };
}

var markMap = function(map, marking, coordinate, amount) {
  amount = (typeof amount !== 'undefined') ? amount : 1;

  var height = map.length;
  var width = map[0].length;

  for (var i = 0; i < amount; i++) {
    for (var j = 0; j < amount; j++) {
      if (coordinate.y + i < height && coordinate.x + j < width) {
        map[coordinate.y + i][coordinate.x + j] = marking;
      }
    }
  }
}

var makeFakeMap = function(height, width, ...markings) {
  // Default arguments
  height = (typeof height !== 'undefined') ? height : 5;
  width = (typeof width !== 'undefined') ? width : 5;
  // markings = (typeof markings !== 'undefined') ? markings : { 'X': 1 };
  markings = (typeof markings !== 'undefined') ? markings : ['X', 1];

  var fillerChar = 'A';

  var fakeMap = buildInitialFakeMap(height, width, fillerChar);

  for (var i = 0; i < markings.length; i += 2) {
    var markChar = markings[i];
    var amount = markings[i+1];
    amount = (typeof amount !== 'undefined') ? amount : 1;

    // Mark the spots randomly
    var markedPosition = generate2DCoordinate(height, width);
    markMap(fakeMap, markChar, markedPosition, amount);
  }

  return fakeMap;
};

console.log(makeFakeMap(5, 5, 'F', 2, 'X').join('\n'));
console.log(makeFakeMap(5, 5, 'F', 3, 'W', 4, 'D', 4, 'X', 1).join('\n'));
console.log(makeFakeMap(5, 5, 'W', 1, 'D', 10, 'F', 4, 'X').join('\n'));
