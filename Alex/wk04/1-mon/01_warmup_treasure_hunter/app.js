// ---
// source:
// - title: WDI Treasure Hunter Warmup
//   url: https://gist.github.com/kasun-maldeni/f0aaae72a93520c7ecabf2c9ea6faefe
// ---

console.log("app.js loaded");

var treasureFinder = function(map, spotMarker) {
  // default to 'X' marks the spot
  spotMarker = (typeof spotMarker !== 'undefined') ? spotMarker : 'X';

  var count = map.reduce(function(sum, row) {
    return sum + row.reduce((acc, value) => (value === spotMarker) ? ++acc : acc, 0);
  }, 0);

  if (count > 1) { return 'that doesnt belong in a museum!'; }

  var x, y;

  x = map.findIndex(function(row) {
    y = row.indexOf(spotMarker);
    return y !== -1;
  });

  return [x, y];
};

// # [It belongs in a museum!](https://www.youtube.com/watch?v=-abUtRbUS_U)

// You are an adventuring archaeologist, and have found some treasure maps!
// There are too many to check individually, so write a function
// 'treasureFinder' that takes an array of arrays as an argument (see sample
// inputs below) and returns an array with the location of the treasure (X) as
// an array representing the X and Y coordinates, for example:

var map1 = [
  ["A","A","A","A","A"],
  ["A","A","A","A","A"],
  ["A","A","X","A","A"],
  ["A","A","A","A","A"],
  ["A","A","A","A","A"]
];

// Sample output:

treasureFinder(map1) // should return [2, 2];
console.log(treasureFinder(map1));

// You can assume that the size of the treasure map will be the same.

// ### Some additional maps:


var map2 = [
  ["A","A","A","A","A"],
  ["A","A","A","A","A"],
  ["A","A","A","A","A"],
  ["A","A","A","A","A"],
  ["A","X","A","A","A"]
];

var map3 = [
  ["A","A","A","A","A"],
  ["A","A","V","A","A"],
  ["A","A","A","V","A"],
  ["v","v","V","v","X"],
  ["A","V","A","A","A"]
];

var map4 = [
  ["A","A","A","A","A"],
  ["A","A","V","A","A"],
  ["A","A","A","V","A"],
  ["v","v","V","v","A"],
  ["X","V","A","A","A"]
];

console.log(treasureFinder(map2));
console.log(treasureFinder(map3));
console.log(treasureFinder(map4));


// ### Bonus:

// Modify your function to accept maps of any size, and to accept a second
// argument for the key to look for. It should also handle non-unique 'key'
// values gracefully.

var holyGrailMap = [
  ["v","v","V","v","S","S"],
  ["v","v","V","v","S","S"],
  ["v","v","V","v","S","S"],
  ["v","v","V","v","S","S"],
  ["v","v","G","v","S","S"],
  ["v","v","H","v","S","S"],
  ["v","v","V","v","S","S"],
  ["A","V","A","A","A","S"]
];

//sample outputs:

treasureFinder(holyGrailMap, "G") // should return [4, 2];
console.log(treasureFinder(holyGrailMap, "G"));
treasureFinder(holyGrailMap, "H") // should return [5, 2];
console.log(treasureFinder(holyGrailMap, "H"));
treasureFinder(holyGrailMap, "H") // should return [5, 2];
console.log(treasureFinder(holyGrailMap, "H"));

treasureFinder(holyGrailMap, "V")
// should return 'that doesnt belong in a museum!';
console.log(treasureFinder(holyGrailMap, "V"));
