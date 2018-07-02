var timer = {
  // All your code goes in here...
  seconds: 0,
  timerId: 0,
  originalStopWatchText: "Stop Watch",

  heading: document.querySelector('h1#timer'),
  startBtn: document.querySelector('#start'),
  pauseBtn: document.querySelector('#pause'),
  resetBtn: document.querySelector('#reset'),

  updateTime: function() {
    this.seconds += 1;
    this.heading.textContent = this.seconds;
  },

  start: function() {
    if (!this.timerId) { // technically `0` or `undefined` not `false`
      this.timerId = setInterval(this.updateTime.bind(this), 1000);
    }
  },

  pause: function() {
    this.timerId = clearInterval(this.timerId);
  },

  reset: function() {
    this.timerId = clearInterval(this.timerId);
    this.seconds = 0;
    this.heading.textContent = this.originalStopWatchText;
  },

  initialize: function() {
    this.startBtn.addEventListener('click', this.start.bind(this));
    this.pauseBtn.addEventListener('click', this.pause.bind(this));
    this.resetBtn.addEventListener('click', this.reset.bind(this));
  }
}
timer.initialize();
