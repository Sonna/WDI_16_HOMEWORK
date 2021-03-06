console.log('app.js loaded');

var gameState = {};
var defaultGameState = {
  rounds: 0,
  players: {
    active: 'naught',
    inactive: 'cross'
  },

  wins: {
    naught: 0,
    cross: 0,
    tie: 0
  },

  running: true
};

function clearGameState() {
  storeGameState(defaultGameState);
}

function initializeGameState() {
  if (!localStorage.getItem('gameState-running')) {
    clearGameState();
  }
}

function restoreGameState() {
  gameState = {
    rounds: localStorage.getItem('gameState-rounds'),
    players: {
      active: localStorage.getItem('gameState-players-active'),
      inactive: localStorage.getItem('gameState-players-inactive')
    },

    wins: {
      naught: localStorage.getItem('gameState-wins-naught'),
      cross: localStorage.getItem('gameState-wins-cross'),
      tie: localStorage.getItem('gameState-wins-tie')
    },

    running: localStorage.getItem('gameState-running')
  };
};

function storeGameState(currentState) {
  localStorage.setItem('gameState-rounds', currentState.rounds);
  localStorage.setItem('gameState-players-active', currentState.players.active);
  localStorage.setItem('gameState-players-inactive', currentState.players.inactive);
  localStorage.setItem('gameState-wins-naught', currentState.wins.naught);
  localStorage.setItem('gameState-wins-cross', currentState.wins.cross);
  localStorage.setItem('gameState-wins-tie', currentState.wins.tie);
  localStorage.setItem('gameState-running', currentState.running);
};

var board = document.querySelector('.board');
var cells = document.querySelectorAll('.cell');
var rows = document.querySelectorAll('.row');

var roundsEl = document.querySelector('.rounds');
var detailsEl = document.querySelector('.details');
var winnerEl = document.querySelector('.winner');

var controls = document.querySelector('.controls');
var resetBoardBtn = controls.querySelector('.reset-board');
var resetScoresBtn = controls.querySelector('.reset-scores');
var resetAllBtn = controls.querySelector('.reset-all');

var winsEl = document.querySelector('.wins');
var naughtWinsEl = winsEl.querySelector('.naught');
var crossWinsEl = winsEl.querySelector('.cross');
var tieWinsEl = winsEl.querySelector('.tie');

var possibleWinStates = {
  majorDiagonal: { draw: false, cells: [rows[0].children[0], rows[2].children[2]] },
  minorDiagonal: { draw: false, cells: [rows[0].children[2], rows[2].children[0]] },

  topRow: { draw: false, cells: [rows[0].children[0], rows[0].children[2]] },
  middleRow: { draw: false, cells: [rows[1].children[0], rows[1].children[2]] },
  bottomRow: { draw: false, cells: [rows[2].children[0], rows[2].children[2]] },

  leftColumn: { draw: false, cells: [rows[0].children[0], rows[2].children[0]] },
  middleColumn: { draw: false, cells: [rows[0].children[1], rows[2].children[1]] },
  rightColumn: { draw: false, cells: [rows[0].children[2], rows[2].children[2]] }
};

function placePiece(event) {
  if (!gameState.running) { return; }
  if (!event.target.classList.contains('cell')) { return; }
  if (event.target.classList.contains('naught') ||
      event.target.classList.contains('cross')) { return; }
  event.target.classList.add(gameState.players.active);
  checkForWinner(gameState.players.active);
  togglePlayerTurn();
}

function togglePlayerTurn() {
  if (!gameState.running) { return; }
  var tempActive = gameState.players.active;
  var tempInactive = gameState.players.inactive;

  gameState.players = {
    active: tempInactive,
    inactive: tempActive
  };
}

function checkCols(player) {
  possibleWinStates.leftColumn.draw = rows[0].children[0].classList.contains(player) && rows[1].children[0].classList.contains(player) && rows[2].children[0].classList.contains(player);
  possibleWinStates.middleColumn.draw = rows[0].children[1].classList.contains(player) && rows[1].children[1].classList.contains(player) && rows[2].children[1].classList.contains(player);
  possibleWinStates.rightColumn.draw = rows[0].children[2].classList.contains(player) && rows[1].children[2].classList.contains(player) && rows[2].children[2].classList.contains(player);
  return (
    possibleWinStates.leftColumn.draw ||
    possibleWinStates.middleColumn.draw ||
    possibleWinStates.rightColumn.draw
  );
}

function checkRows(player) {
  possibleWinStates.topRow.draw = rows[0].children[0].classList.contains(player) && rows[0].children[1].classList.contains(player) && rows[0].children[2].classList.contains(player);
  possibleWinStates.middleRow.draw = rows[1].children[0].classList.contains(player) && rows[1].children[1].classList.contains(player) && rows[1].children[2].classList.contains(player);
  possibleWinStates.bottomRow.draw = rows[2].children[0].classList.contains(player) && rows[2].children[1].classList.contains(player) && rows[2].children[2].classList.contains(player);
  return (
    possibleWinStates.topRow.draw ||
    possibleWinStates.middleRow.draw ||
    possibleWinStates.bottomRow.draw
  );
}

function checkDiagonals(player) {
  possibleWinStates.majorDiagonal.draw = rows[0].children[0].classList.contains(player) && rows[1].children[1].classList.contains(player) && rows[2].children[2].classList.contains(player);
  possibleWinStates.minorDiagonal.draw = rows[2].children[0].classList.contains(player) && rows[1].children[1].classList.contains(player) && rows[0].children[2].classList.contains(player);
  return (
    possibleWinStates.majorDiagonal.draw ||
    possibleWinStates.minorDiagonal.draw
  );
}

function allCellsFull() {
  return [].every.call(cells, function(cell) {
    return cell.classList.contains('naught') || cell.classList.contains('cross');
  });
}

function updateScoreboard() {
  roundsEl.textContent = gameState.rounds;
  naughtWinsEl.textContent = gameState.wins.naught;
  crossWinsEl.textContent = gameState.wins.cross;
  tieWinsEl.textContent = gameState.wins.tie;
}

function updateWins(winner) {
  winnerEl.textContent = winner + ' Wins!';
  gameState.wins[winner]++;
  updateScoreboard();
}

function checkForWinner(player) {
  if (checkCols(player) || checkRows(player) || checkDiagonals(player)) {
    updateWins(player);
    gameState.running = false;
    storeGameState(gameState);
    detailsEl.classList.remove('hidden');
    drawWinningLine();
  } else if (allCellsFull()) {
    updateWins('tie');
    winnerEl.textContent = 'Draw!';
    gameState.running = false;
    detailsEl.classList.remove('hidden');
    storeGameState(gameState);
  }
}

function clearBoard() {
  cells.forEach(function(cell) {
    cell.classList.remove('naught');
    cell.classList.remove('cross');
  });
  detailsEl.classList.add('hidden');
  removeWinningLine();
}

function resetBoard() {
  clearBoard();
  updateRound();
  gameState.running = true;
  storeGameState(gameState);
}

function resetScores() {
  gameState.rounds = defaultGameState.rounds;
  gameState.wins = defaultGameState.wins;
  storeGameState(gameState);
  updateScoreboard();
}

function resetAll() {
  clearBoard();
  storeGameState(defaultGameState);
  restoreGameState();
  updateScoreboard();
}

function updateRound() {
  gameState.rounds++;
  updateScoreboard();
}

function getOffset( el ) {
  var rect = el.getBoundingClientRect();
  return {
    left: rect.left + window.pageXOffset,
    top: rect.top + window.pageYOffset,
    width: rect.width || el.offsetWidth,
    height: rect.height || el.offsetHeight
  };
}

// == Sourced:
// - [javascript - How to draw a line between two divs? - Stack Overflow]
//   (https://stackoverflow.com/questions/8672369/how-to-draw-a-line-between-two-divs)
function connect(div1, div2, color, thickness) { // draw a line connecting elements
  var off1 = getOffset(div1);
  var off2 = getOffset(div2);
  // find center of div1 (was bottom right)
  var x1 = off1.left + off1.width/2;
  var y1 = off1.top + off1.height/2;
  // find center of div1 (was top right)
  var x2 = off2.left + off2.width/2;
  var y2 = off2.top + off2.height/2;
  // distance
  var length = Math.sqrt(((x2-x1) * (x2-x1)) + ((y2-y1) * (y2-y1)));
  // center
  var cx = ((x1 + x2) / 2) - (length / 2);
  var cy = ((y1 + y2) / 2) - (thickness / 2);
  // angle
  var angle = Math.atan2((y1-y2),(x1-x2))*(180/Math.PI);
  // make hr
  var htmlLineEl = document.createElement('div');
  htmlLineEl.classList.add('winning-move');
  htmlLineEl.setAttribute('style',
    "padding:0px; " +
    "margin:0px; " +
    "height:" + thickness + "px; " +
    "background-color:" + color + "; " +
    "line-height:1px; " +
    "position:absolute; " +
    "left:" + cx + "px; " +
    "top:" + cy + "px; " +
    "width:" + length + "px; " +
    "-moz-transform:rotate(" + angle + "deg); " +
    "-webkit-transform:rotate(" + angle + "deg); " +
    "-o-transform:rotate(" + angle + "deg); " +
    "-ms-transform:rotate(" + angle + "deg); " +
    "transform:rotate(" + angle + "deg);'"
  );
  document.body.appendChild(htmlLineEl);
}

function drawWinningLine() {
  Object.keys(possibleWinStates).forEach(function (key) {
    if (possibleWinStates[key].draw) {
      connect(possibleWinStates[key].cells[0], possibleWinStates[key].cells[1], 'green', 5);
    }
  });
}

function removeWinningLine() {
  var lineEl = document.querySelector('.winning-move');
  if (lineEl) { document.body.removeChild(lineEl); }
}

// document ready
(function() {
  board.addEventListener('click', placePiece);

  resetBoardBtn.addEventListener('click', resetBoard);
  resetScoresBtn.addEventListener('click', resetScores);
  resetAllBtn.addEventListener('click', resetAll);

  initializeGameState();
  restoreGameState();
  updateScoreboard();
})();
