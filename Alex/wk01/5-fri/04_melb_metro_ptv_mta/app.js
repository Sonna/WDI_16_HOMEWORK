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
var alltrainLines = [
  alameinLine,
  glenWaverlyLine,
  sandringhamLine
];

// Write a javascript program that works out display the journey when you give
// it an origin and destination.

var findLine = function(station, trainLines) {
  trainLines = (typeof trainLines !== 'undefined') ? trainLines : alltrainLines;

  return trainLines.find(function(trainLine) {
    return trainLine.includes(station);
  });
}

var calculateLineJourney = function(station,
                                    endOfJourney,
                                    trainLine,
                                    intersection) {
  endOfJourney = (typeof endOfJourney !== 'undefined') ? endOfJourney : false;
  trainLine = (typeof trainLine !== 'undefined') ? trainLine.slice() :
                                                   findLine(station).slice();
  intersection = (typeof intersection !== 'undefined') ? intersection :
                                                         intersectionStation;

  var start = endOfJourney ? intersection : station;
  var end = endOfJourney ? station : intersection;

  var startIndex = trainLine.indexOf(start);
  var endIndex = trainLine.indexOf(end);

  if (startIndex > endIndex) {
    trainLine.reverse();
    startIndex = trainLine.indexOf(start);
    endIndex = trainLine.indexOf(end);
  }

  return trainLine.slice(startIndex, endIndex + (endOfJourney ? 1 : 0));
};

var calculateJourney = function(origin, destination) {
  var originLine = findLine(origin, alltrainLines);
  var destinationLine = findLine(destination, alltrainLines);

  var originLineToIntersection = calculateLineJourney(origin);
  //   origin, false, originLine, intersectionStation
  // );
  var destinationLineToIntersection = calculateLineJourney(destination, true);
  //   destination, true, destinationLine, intersectionStation
  // );

  return originLineToIntersection.concat(destinationLineToIntersection);
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
var journeyDetails = function(origin, destination) {
  // var journey = ["Melbourne Central", "Parliament", "Richmond"];
  var journey = calculateJourney(origin, destination);
  var stopsTotal = journey.length - 1;

  return 'origin: ' + origin + '\n' +
    'destination: ' + destination + '\n' +
    '\n' +
    journey.join(' -----> ') + '\n' +
    '\n' +
    stopsTotal + ' stops total';
};

var printJourney = function(origin, destination) {
  console.log(journeyDetails(origin, destination));
};

// You may want to *hard code* the origin and destination instead of getting
// user input for easier testing in the beginning.

printJourney("Melbourne Central", "Richmond");
console.log('\n');
printJourney('Tooronga', 'Windsor');
console.log('\n');
printJourney('Burnley', 'Melbourne Central');


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
