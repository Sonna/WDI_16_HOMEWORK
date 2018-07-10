// ---
// source:
// - title: WDI Coinflip Solution
//   url: https://gist.github.com/kasun-maldeni/310221e18c5a9e73284ec6caa9bbf359
// ---

var tallyHeads = 0;
var tallyTails = 0;

var img = document.getElementById("clickImage");
var tally = document.getElementById("tallyTotal");

var coinFlip = function () {
  return Math.round(Math.random()) === 0 ? "heads" : "tails";
};

// when image is clicked, flip coin and update tally
img.addEventListener("click", function () {
  if (coinFlip() === "heads") {
    tallyHeads++;
  } else {
    tallyTails++;
  };
  if (tallyHeads === 5) {
    tally.innerHTML = "HEADS WINS!";
    tallyHeads = 0;
    tallyTails = 0;
  } else if (tallyTails === 5){
    tally.innerHTML = "TAILS WINS!"
    tallyHeads = 0;
    tallyTails = 0;
  } else {
    tally.innerHTML = "You have flipped " + tallyHeads + " heads and " + tallyTails + " tails."
  }
});
