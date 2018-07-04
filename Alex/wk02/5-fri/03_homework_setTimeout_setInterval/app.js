var heyListen = function(caller) {
  console.log('Hey listen!' + ' From: ' + caller);
}

// Set Timeout
// Display "Hey listen!" after half a second or 0.5 second (500 milliseconds):
setTimeout(heyListen('setTimeout'), 500);

// Set Interval
// Log "Hey listen!" every 3 seconds (3000 milliseconds):
setInterval(heyListen, 3000, 'setInterval');

// == References:
// - [Window setInterval Method]
//   (https://www.w3schools.com/jsref/met_win_setinterval.asp)
