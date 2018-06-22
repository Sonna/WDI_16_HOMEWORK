// ---
// source:
// - title: melb_metro_ptv_mta.md
//   url: https://gist.github.com/epoch/0771187f6d02e1006210#file-melb_metro_ptv_mta-md
// ---

// ### PT PLANNER
// #### Melbourne Public Transport Journey Planner

// There are 3 train lines:

// The **Alamein** line has the following stops:
// ```
// Flinders Street - Richmond - East Richmond - Burnley - Hawthorn - Glenferrie
// ```
var alameinLine = [
  "Flinders Street",
  "Richmond",
  "East Richmond",
  "Burnley",
  "Hawthorn",
  "Glenferrie"
];

// The **Glen Waverly** line has the following stops:
// ```
//   Flagstaff - Melbourne Central - Parliament - Richmond - Kooyong - Tooronga
// ```
var glenWaverlyLine = [
  "Flagstaff",
  "Melbourne Central",
  "Parliament",
  "Richmond",
  "Kooyong",
  "Tooronga"
];

// The **Sandringham** line has the following stops:
// ```
//   Southern Cross - Richmond - South Yarra - Prahran - Windsor.
// ```
var sandringhamLine = [
  "Southern Cross",
  "Richmond",
  "South Yarra",
  "Prahran",
  "Windsor"
];

// ---

// All 3 train lines intersect at **Richmond**, but there are NO other
// intersection points as trains run express.
var intersectionStation = "Richmond";
// var allLines = [
//   alameinLine,
//   glenWaverlyLine,
//   sandringhamLine
// ];

// Write a javascript program that works out display the journey when you give
// it an origin and destination.

var findLine = function(station) { //, allLines) {
  if (alameinLine.includes(station)) {
    return alameinLine;
  } else if (glenWaverlyLine.includes(station)) {
    return glenWaverlyLine;
  } else if (sandringhamLine.includes(station)) {
    return sandringhamLine;
  };
}

var calculateJourney = function(origin, destination) {
  var originLine = findLine(origin);
  var destinationLine = findLine(destination);

  // Resolve which train line belongs to "Richmond" stop bug, and set the
  // `originLine` to the `destinationLine` or vice versa to prevent simply
  // journey resolution
  if (origin === intersectionStation) {
    originLine = destinationLine;
  }

  if (destination === intersectionStation) {
    destinationLine = originLine;
  }

  // alameinLine
  // [ Melbourne Central -----> Parliament -----> Richmond
  if (originLine === destinationLine) {
    var startIndex = originLine.indexOf(origin);
    var endIndex = originLine.indexOf(origin);

    return originLine.slice(startIndex, endIndex + 1); // include last station
  } else {
    var startOriginIndex = originLine.indexOf(origin);
    var endOriginIndex = originLine.indexOf(intersectionStation);

    var startDestinationIndex = destinationLine.indexOf(intersectionStation);
    var endDestinationIndex = destinationLine.indexOf(destination);

    return originLine.slice(
      startOriginIndex, endOriginIndex
    ).concat(
      destinationLine.slice(
        startDestinationIndex, endDestinationIndex + 1
      )
    );
  }
}

// example:

// ```
// origin: Melbourne Central
// destination: Richmond
//
// Melbourne Central -----> Parliament -----> Richmond
//
// 2 stops total
// ```
var printJourney = function(origin, destination) {
  // var journey = ["Melbourne Central", "Parliament", "Richmond"];
  var journey = calculateJourney(origin, destination);
  var stopsTotal = journey.length - 1;
  var details =
    'origin: ' + origin + '\n' +
    'destination: ' + destination + '\n' +
    '\n' +
    journey.join(' -----> ') + '\n' +
    '\n' +
    stopsTotal + ' stops total';

  console.log(details);
};

// You may want to *hard code* the origin and destination instead of getting
// user input for easier testing in the beginning.

printJourney("Melbourne Central", "Richmond");

// ##### Hints:

// Consider diagramming the lines by sketching out the train lines and their
// stops and intersection. Think about what data structure to use to store each
// line and all the stops on each line.

// The key to the lab is the intersection of the lines at Richmond.

// #### Non-Required Bonus:

// * input validation
//   - User must enter a line and station in the subway network
//   - If the user enters something else, your program should handle it
// * Add additional stations


// #### Resources
// [Here's a map of the train network to help](https://drive.google.com/a/generalassemb.ly/file/d/0Bx09n7UgX2HyaGswNVNWd3B0bEE/view?usp=sharing)
