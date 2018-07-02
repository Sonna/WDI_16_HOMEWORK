// ----
// source:
// - title: wdi_week_timer_callback_lab.md · GitHub
//   url: https://gist.github.com/epoch/4417653f1ebfa343e65f#file-wdi_week_timer_callback_lab-md
// ----

// # Callbacks Lab

// ## Introduction

// We've seen and practiced callbacks outside of the DOM, but now, we've been
// tasked with building out the behavior for a digital web stopwatch.  The
// client has requested the following:

// * When "Start" is clicked, the text "Stop Watch" should be replaced by "Time
//   elapsed: 0", and the count should increment every second
// * When "Reset" is clicked, the text should return to "Stop Watch"
// * When "Pause" is clicked, the text should say "Time elapsed: 1", but stop
//   incrementing

// #### Requirements

// Just take it step by step and try to meet the benchmarks below in order.

// 1. Create Javascript selectors that target each of the timer buttons.
var resetBtn = document.querySelector('#reset');
var startBtn = document.querySelector('#start');
var pauseBtn = document.querySelector('#pause');

// 2. Create click handlers (empty, for now) for each of the timer buttons.
resetBtn.addEventListener('click', function() {});
startBtn.addEventListener('click', function() {});
pauseBtn.addEventListener('click', function() {});

// 3. Instantiate `seconds` and `timerId` variables for your timer. The latter
//    will make more sense after reading up on `setInterval()`.
var seconds = 0;
var timerId = 0;

// 4. Create an `updateTime()` function that increments the `seconds` counter
//    and inserts that value into the `<h1>` element with `id="timer"`.
var updateTime = function() {
  seconds += 1;
  document.querySelector('h1#timer').textContent = seconds;
};

// 5. Inside your click handler for the start button...
startBtn.addEventListener('click', function() {
//   - Replace "Stop Watch" in the HTML with the content of the `seconds`
//     variable.
//   - Use `setInterval()` to increment the timer by 1 every second.
  if (!timerId) { // technically `0` or `undefined` not `false`
    timerId = setInterval(updateTime, 1000);
  }
});

// 6. Inside your click handler for the pause button...
pauseBtn.addEventListener('click', function() {
//   - Stop -- but do not reset! -- the timer using `clearInterval()`.
  timerId = clearInterval(timerId);
});

// 7. Once again, inside your click handler for the start button...
//   - Make sure the timer starts back up when you hit the "Start" button after
//     hitting "Pause".

var originalStopWatchText = document.querySelector('h1#timer').textContent;

resetBtn.addEventListener('click', function() {
// 8. Inside your click handler for the reset button...
//   - Stop the timer using `clearInterval()`.
  timerId = clearInterval(timerId);
//   - Reset the timer.
  seconds = 0;
//   - Replace the time in your HTML with the original "Stop Watch" text.
  document.querySelector('h1#timer').textContent = originalStopWatchText;
});

// **Bonus**

// Reformat your timer so that everything in your `timers.js` file -- variables
// and functions -- are part of a global object. It would look something like...

// ```javascript
// // Start of .js file

// var timer = {
//   // All your code goes in here...
// }
// ```

// #### Starter Code

// Spend 10 minutes looking at
// [JavaScript Timers](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Timers)
// documentation, then check out the specific documentation for `setInterval`
// and `clearInterval`.

// When you feel you're ready, open the [starter-code](starter-code) and begin
// building your JavaScript file; the interface for the stop watch can be found
// in the `index.html` file and the styles are done for you!

// #### Deliverable

// Please find below some screenshots of the final web app. Upon clicking start,
// your app should begin counting:

// ![Screenshot](https://i.imgur.com/yfivjng.png)

// When clicking pause, it should stop the timer at whatever number it's
// currently at.  Upon clicking reset, it should bring you back to the home
// screen:

// ![Screenshot](https://i.imgur.com/ABAzs2x.png)


// ## Additional Resources

// - [JavaScript Timers](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Timers)
