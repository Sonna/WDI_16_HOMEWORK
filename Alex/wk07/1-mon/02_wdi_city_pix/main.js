// # City Pix

// Clone this down to your homework repo, and please remember to **remove the
// inner git repo**.

// You must complete these two tasks modifying the `main.js` file ONLY. Do NOT
// change the HTML file. Make the following changes in JavaScript:

// 1. Update the drop down box to show the five cities NYC, SF, LA, SYD, ATX.
//    **Note:** You might need to research how to add DOM objects to a web page
//    to be able to add option tags to the select tag.
var cities = ["NYC", "SF", "LA", "SYD", "ATX"];
var selectEl = document.querySelector("#city-type");

cities.forEach(function(city) {
  var cityOptionEl = document.createElement("option");
  cityOptionEl.value = city;
  cityOptionEl.innerText = city;
  selectEl.appendChild(cityOptionEl);
});

// 2. When you select a city in the drop-down box, the background image should
//    change to show that city. The images for the five cities are in the images
//    folder. We have already provided the css code for changing the background
//    image in the `style.css` file (at the bottom). Feel free to use those
//    classes.
