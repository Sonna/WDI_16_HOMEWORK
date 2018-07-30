// ---
// source:
// - title: WDI Proximity Warmup
//   url: https://gist.github.com/kasun-maldeni/1a3a65b1a2c8019fb1a4cf367ada4870
// ---

// # Proximity

// You and some friends usually play a gathering game (like a scavenger hunt)
// using geo-coordinates in the city, but it has gotten so popular that many
// people want to join in. One of your friends created an API. An API is a way
// for us to get data from a service. But now you want to build an App to help
// people decide what to find in the city.

// You are given the following set of data as a result from an API request and
// you want to sort those results in terms of proximity to your starting
// location (General Assembly).

// ```javascript
var startPoint = {name: "General Assembly", location: {lat: -37.818555, long: 144.959076}}
var results = [
  {name: "Melbourne Cricket Grounds", location: {lat: -37.819967, long: 144.983449}},
  {name: "Flagstaff Gardens", location: {lat: -37.810680, long: 144.954352}},
  {name: "Emporium Melbourne", location: {lat: -37.812433, long: 144.963787}},
  {name: "City Library", location: {lat: -37.817039, long: 144.965983}},
  {name: "Southern Cross Station", location: {lat: -37.818281, long: 144.952776}},
  {name: "Sea Life Melbourne Aquarium", location: {lat: -37.820640, long: 144.958325}}
]
// ```

// Write a function in JS to print the names of the results in order of closest
// to your location to furthest away.

// Also, explain what your assumptions are for the way you are calculating
// distance between the start point and the results.

// ### Extension

// Use HTML5 Geolocation to get your current location and order the results
// based on that. This way, while the user is walking around the city, they can
// see which result is closest to their current location.

function magnitude(coordinate) {
  return Math.sqrt(Math.pow(coordinate.lat, 2) + Math.pow(coordinate.long, 2));
}

function calcDistance(a, b) {
  return magnitude(b) - magnitude(a);
}

// function calcDistanceFromStartPoint(start) {
//   return function(a, b) { return magnitude(start) - (magnitude(b) - magnitude(a)); };
// }

function calcDistanceFromStartPoint(start) {
  return function(a, b) { return (magnitude(start) - magnitude(a)) - magnitude(b); };
}

function printNames(collection) {
  collection.forEach(function(element) {
    console.log(element.name);
  });
}

console.log(results.sort(calcDistance));
var sorted = results.sort(calcDistanceFromStartPoint(startPoint));
console.log(sorted);

printNames(sorted);
