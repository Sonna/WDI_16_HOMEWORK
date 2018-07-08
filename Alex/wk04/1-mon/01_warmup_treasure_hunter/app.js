// ---
// source:
// - title: WDI Treasure Hunter Warmup
//   url: https://gist.github.com/kasun-maldeni/f0aaae72a93520c7ecabf2c9ea6faefe
// ---

console.log("app.js loaded");

var treasureFinder = function() {};

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
treasureFinder(holyGrailMap, "H") // should return [5, 2];
treasureFinder(holyGrailMap, "H") // should return [5, 2];

treasureFinder(holyGrailMap, "V")
// should return 'that doesnt belong in a museum!';

