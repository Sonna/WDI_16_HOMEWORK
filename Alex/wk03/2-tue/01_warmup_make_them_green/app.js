// ----
// source:
// - title: Make Them Green - WDI Warmup
//   url: https://gist.github.com/kasun-maldeni/87c3e68843d1e6e16bf32cd4398f7d86
// ----

// # Make Them Green

// 1. Create 3 boxes (divs) in an html file, give them a border of `1px solid
//    black` and a height and width of `100px`, so you can see them.

// 2. When you click on any box, it's background color should immediately become
//    **red**.
var allDivs = document.querySelectorAll('div');

var clickHandler = function(event) {
  // event.target.style.backgroundColor = 'red';
  event.target.classList.add('clicked');
  checkForAllClicked();
}

allDivs.forEach(function(domObject) {
  domObject.addEventListener('click', clickHandler);
  //                                  ^ equivalent v
  // domObject.addEventListener('click', function(event) {
  //   // event.target.style.backgroundColor = 'red';
  //   event.target.classList.add('clicked');
  //   checkForAllClicked();
  // });
  // domObject.addEventListener('click', checkForAllClicked);
});

// 3. After **every** box has been clicked, change all of them immediately to
//    **green**.

function checkForAllClicked() {
  var allClickedDivs = document.querySelectorAll('div.clicked');

  if(allClickedDivs.length === allDivs.length) {
    allDivs.forEach(function(el) {
      el.classList.add('all-green');
    });
  }
}
