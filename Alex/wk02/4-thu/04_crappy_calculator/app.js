document.querySelector('div');
// => <div><input type="number"></div>

// document.querySelectorAll('div');
// => NodeList(5) [div, div, div, div, div]

var num1Input = document.querySelector('.num1-input');
var num2Input = document.querySelector('.num2-input');
var calcBtn = document.querySelector('.calc-btn');
var resultDiv = document.querySelector('.result-div');

// resultDiv.textContent; // => ''
// resultDiv.textContent = '1000';

// num1Input.value; // => ''
// num1Input.value = '35';

var add = function() {
  var total = Number(num1Input.value) + Number(num2Input.value);
  resultDiv.textContent = total;
}

calcBtn.addEventListener('click', add);
