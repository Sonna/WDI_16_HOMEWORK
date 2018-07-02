var timer = {
  // All your code goes in here...
  seconds: 0,
  timerId: 0,
  originalStopWatchText: "Stop Watch",

  updateTime: function() {
    this.seconds += 1;
    document.querySelector('h1#timer').textContent = this.seconds;
  },

  startBtn: function() {
    if (!this.timerId) { // technically `0` or `undefined` not `false`
      this.timerId = setInterval(this.updateTime.bind(this), 1000);
    }
  },

  pauseBtn: function() {
    this.timerId = clearInterval(this.timerId);
  },

  resetBtn: function() {
    this.timerId = clearInterval(this.timerId);
    this.seconds = 0;
    document.querySelector('h1#timer').textContent = this.originalStopWatchText;
  },

  initialize: function() {
    document.querySelector('#start').addEventListener('click', this.startBtn.bind(this));
    document.querySelector('#pause').addEventListener('click', this.pauseBtn.bind(this));
    document.querySelector('#reset').addEventListener('click', this.resetBtn.bind(this));
  }
}
timer.initialize();
