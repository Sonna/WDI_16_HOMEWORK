// write a program that will ask for your name
// it will then display `hello name` where `name` is the name you entered.

// - how can I take input???
// - how am I going to show the greeting???
// - how to join strings together and how to store the input name???
var name = prompt("Please enter your name", "n/a")
console.log("Hello today! " + name);

// Otherwise

var contentEl = document.createElement('div');
contentEl.setAttribute('id', 'content');
document.body.appendChild(contentEl);

var inputEl = document.createElement('input');
inputEl.addEventListener("blur", function(event) {
  // var el = document.createElement('p');
  // el.innerHTML = "Hello today! " + name;
  // document.body.appendChild(el);
  document.getElementById('content').innerHTML =
    "<p>Hello today! " + event.target.value + "</p>";
}, true);

document.body.appendChild(inputEl);
