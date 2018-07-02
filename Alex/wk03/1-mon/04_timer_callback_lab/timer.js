var timer = {
  // All your code goes in here...
  seconds: 0,
  timerId: 0,
  originalStopWatchText: "Stop Watch",

  updateTime: function() {
    timer.seconds += 1;
    document.querySelector('h1#timer').textContent = timer.seconds;
  },

  startBtn: function() {
    if (!timer.timerId) { // technically `0` or `undefined` not `false`
      timer.timerId = setInterval(timer.updateTime, 1000);
    }
  },

  pauseBtn: function() {
    timer.timerId = clearInterval(timer.timerId);
  },

  resetBtn: function() {
    timer.timerId = clearInterval(timer.timerId);
    timer.seconds = 0;
    document.querySelector('h1#timer').textContent = timer.originalStopWatchText;
  },

  initialize: function() {
    document.querySelector('#start').addEventListener('click', timer.startBtn);
    document.querySelector('#pause').addEventListener('click', timer.pauseBtn);
    document.querySelector('#reset').addEventListener('click', timer.resetBtn);
  }
}
timer.initialize();
