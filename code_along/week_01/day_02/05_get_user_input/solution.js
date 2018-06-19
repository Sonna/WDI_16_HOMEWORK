// write a program that will ask for your name
// it will then display `hello name` where `name` is the name you entered.

// - how can I take input???
// - how am I going to show the greeting???
// - how to join strings together and how to store the input name???
var name = prompt("Please enter your name", "n/a");
var age = prompt("How old are you?", "n/a");
console.log("Hello today! " + name);
// console.log("Hello today! " + name + ", you are " + age + "years old.");

if (age >= 100) {
  console.log("Wow! You're ancient.");
} else {
  console.log("you are " + age + " years old.");
}

// Otherwise

var contentEl = document.createElement('div');
contentEl.setAttribute('id', 'content');

var nameEl = document.createElement('div');
nameEl.setAttribute('id', 'name');
contentEl.appendChild(nameEl);

var ageEl = document.createElement('div');
ageEl.setAttribute('id', 'age');
contentEl.appendChild(ageEl);

document.body.appendChild(contentEl);

var inputEl = document.createElement('input');
inputEl.addEventListener("blur", function(event) {
  // var el = document.createElement('p');
  // el.innerHTML = "Hello today! " + name;
  // document.body.appendChild(el);
  document.getElementById('name').innerHTML =
    "<p>Hello today! " + event.target.value + "</p>";
}, true);

document.body.appendChild(inputEl);

var inputEl = document.createElement('input');
inputEl.addEventListener("blur", function(event) {
  var age = event.target.value;
  if (age >= 100) {
    document.getElementById('age').innerHTML =
      "Wow! You're ancient.";
  } else {
    document.getElementById('age').innerHTML =
      "you are " + age + " years old.";
  }
}, true);

document.body.appendChild(inputEl);
