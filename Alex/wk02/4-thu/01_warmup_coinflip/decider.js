// ---
// source:
// - title: WDI Coinflip Warmup
//   url: https://gist.github.com/kasun-maldeni/c337852cb0bf5072d6e91cb5ba78500e
// - title: 3E2FA47C00000578-4307326-image-a-19_1489366007479.jpg
//   url: http://i.dailymail.co.uk/i/pix/2017/03/13/00/3E2FA47C00000578-4307326-image-a-19_1489366007479.jpg
// ---

// # CoinFlip
// ### The Ultimate Life Decider
// Never make a decision again!

// #### Core problem

// 1. Create a file called `decider.js`
// 2. Write a function called `coinFlip` that will `console.log` HEADS or TAILS
//    when called
// 3. Add a counter that declares `WINNER` in the console when either HEADS or
//    TAILS is flipped 5 times.

var coinFlip = function() {
  var headsOrTails = Math.round(Math.random()) ? 'HEADS' : 'TAILS';
  console.log(headsOrTails);
  return headsOrTails;
}

var result;
var results = {
  'HEADS': 0,
  'TAILS': 0
};

while (results.HEADS < 5 && results.TAILS < 5) {
  result = coinFlip();
  results[result] += 1;
}

if (results.HEADS === 5) {
  console.log('WINNER, HEADS');
}

if (results.TAILS === 5) {
  console.log('WINNER, TAILS');
}

// == References:
// - [JavaScript random generate 0 or 1 integer - Stack Overflow]
//   (https://stackoverflow.com/questions/45136711/javascript-random-generate-0-or-1-integer)

// #### Extension

// 1. Create a file called `decider.html`
// 2. Find any coin image online
// 3. Link the `.js` file, while you're there you may also decide to add a
//    `.css` file for some styling
// 4. Now add the necessary components to the `decider.html` file so that when
//    the coin image is clicked the `coinFlip` function result and tally are
//    returned somewhere on the page.

var results = {
  'HEADS': 0,
  'TAILS': 0
};

var updateCount = function(results) {
  var headsCountEl = document.getElementById('heads-result');
  var tailsCountEl = document.getElementById('tails-result');

  headsCountEl.innerText = results.HEADS;
  tailsCountEl.innerText = results.TAILS;

  headsCountEl.parentNode.replaceChild(headsCountEl, headsCountEl);
  tailsCountEl.parentNode.replaceChild(tailsCountEl, tailsCountEl);
};

var findWinner = function(results) {
  if (results.HEADS === 5) {
    var el = document.getElementById('winner');
    el.innerText = 'WINNER, HEADS';
    // document.body.appendChild(el);
    el.parentNode.replaceChild(el, el);
  }

  if (results.TAILS === 5) {
    var el = document.getElementById('winner');
    el.innerText = 'WINNER, TAILS';
    // document.body.appendChild(el);
    el.parentNode.replaceChild(el, el);
  }
}

var coinEl = document.getElementsByClassName('coin')[0];

coinEl.addEventListener('click', function() {
  var result = coinFlip();
  results[result] += 1;
  updateCount(results);
  findWinner(results);
  coinEl.setAttribute('class', 'coin ' + result.toLowerCase());
});

