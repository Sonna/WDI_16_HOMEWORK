var stations = Array.from(
  alltrainLines.reduce((a, x) => a.concat(x), [])
               .reduce((a, x) => a.add(x), new Set())
);

var formEl = document.createElement('form');
formEl.setAttribute('autocomplete', 'off');
formEl.setAttribute('action', '#');

var fromDivEl = document.createElement('div');
fromDivEl.setAttribute('class', 'autocomplete');
fromDivEl.setAttribute('style', 'width:300px;');
var fromInputEl = document.createElement('input');
fromInputEl.setAttribute('id', 'from');
fromInputEl.setAttribute('name', 'from');
fromInputEl.setAttribute('type', 'text');
fromInputEl.setAttribute('placeholder', 'From: Station');
fromDivEl.appendChild(fromInputEl);
formEl.appendChild(fromDivEl);

var toDivEl = document.createElement('div');
toDivEl.setAttribute('class', 'autocomplete');
toDivEl.setAttribute('style', 'width:300px;');
var toInputEl = document.createElement('input');
toInputEl.setAttribute('id', 'to');
toInputEl.setAttribute('name', 'to');
toInputEl.setAttribute('type', 'text');
toInputEl.setAttribute('placeholder', 'To: Station');
toDivEl.appendChild(toInputEl);
formEl.appendChild(toDivEl);

var submitInputEl = document.createElement('input');
submitInputEl.setAttribute('type', 'submit');
formEl.appendChild(submitInputEl);

formEl.addEventListener("submit", function (event) {
  event.preventDefault();
  var to = document.getElementById("to").value;
  var from = document.getElementById("from").value;

  var el = document.getElementById('output') ?
    document.getElementById('output') :
    document.createElement('pre');

  el.setAttribute('id', 'output');
  el.textContent = printJourney(from, to);
  document.body.appendChild(el);
});

document.body.appendChild(formEl);

autocomplete(document.getElementById("from"), stations);
autocomplete(document.getElementById("to"), stations);
