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

calcBtn.addEventListener('click', function() {
  resultDiv.textContent = parseInt(num1Input.value) + parseInt(num2Input.value);
});
