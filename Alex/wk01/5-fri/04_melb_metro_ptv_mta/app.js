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
  "Glenferrie",
  "Auburn",
  "Camberwell",
  "Riversdale",
  "Willison",
  "Hartwell",
  "Burwood",
  "Ashburton",
  "Alamein"
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
  "Tooronga",
  "Gardiner",
  "Glen Iris",
  "Darling",
  "East Malvern",
  "Holmesglen",
  "Jordanville",
  "Mount Waverly",
  "Syndal",
  "Glen Waverly"
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
  "Windsor",
  "Balaclava",
  "Ripponlea",
  "Eisternwick",
  "Gardenvale",
  "North Brighton",
  "Middle Brighton",
  "Brighton Beach",
  "Hampton",
  "Sandringham"
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
  var start, end, addLastStation;
  if (endOfJourney) {
    start = intersection;
    end = station;
    addLastStation = 1;
  } else {
    start = station;
    end = intersection;
    addLastStation = 0;
  }

  var startIndex = trainLine.indexOf(start);
  var endIndex = trainLine.indexOf(end);

  if (startIndex > endIndex) {
    trainLine.reverse();
    startIndex = trainLine.indexOf(start);
    endIndex = trainLine.indexOf(end);
  }

  return trainLine.slice(startIndex, endIndex + addLastStation);
};

var calculateJourney = function(origin, destination) {
  var originToIntersection = calculateLineJourney(origin);
  var intersectionToDestination = calculateLineJourney(destination, true);

  return originToIntersection.concat(intersectionToDestination);
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
var from, to;

if (typeof prompt !== 'undefined' && typeof QUnit === 'undefined') {
  from = prompt("From: station", "Melbourne Central");

  while(!findLine(from)) {
    from = prompt(
      "Could not find " + from + " station, please enter another From: station",
      from
    );
  }

  to = prompt("To: station", "Richmond");

  while(!findLine(to)) {
    to = prompt(
      "Could not find " + to + " station, please enter another To: station",
      to
    );
  }

  printJourney(from, to);

  var el = document.createElement('pre');
  el.textContent = journeyDetails(from, to);
  document.body.appendChild(el);
}

// #### Resources
// [Here's a map of the train network to help](https://drive.google.com/a/generalassemb.ly/file/d/0Bx09n7UgX2HyaGswNVNWd3B0bEE/view?usp=sharing)
