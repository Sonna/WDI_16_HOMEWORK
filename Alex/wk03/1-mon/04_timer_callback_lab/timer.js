var timer = {
  // All your code goes in here...
  seconds: 0,
  timerId: 0,
  originalStopWatchText: "Stop Watch",

  updateTime: function() {
    timer.seconds += 1;
    document.querySelector('h1#timer').textContent = timer.seconds;
  },

  startBtn: document.querySelector('#start').addEventListener('click', function() {
    if (!timer.timerId) { // technically `0` or `undefined` not `false`
      timer.timerId = setInterval(timer.updateTime, 1000);
    }
  }),

  pauseBtn: document.querySelector('#pause').addEventListener('click', function() {
    timer.timerId = clearInterval(timer.timerId);
  }),

  resetBtn: document.querySelector('#reset').addEventListener('click', function() {
    timer.timerId = clearInterval(timer.timerId);
    timer.seconds = 0;
    document.querySelector('h1#timer').textContent = timer.originalStopWatchText;
  })
}
