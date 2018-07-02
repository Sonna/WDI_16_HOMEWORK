(1.) Write the correct javascript to select the second h1 element:

```javascript
document.querySelectorAll('h1')[1];
```

(2.) How would you change the contents of the element to be 'Friend'?

```html
<html>
  <div>
    <h1>Hello</h1>
  </div>

  <ul>
    <h1>Goodbye<h1>
  </ul>
</html>
```

```javascript
document.querySelectorAll('h1')[1].textContent = 'Friend';
```

(3.) How would you add an event listener to the button element inside the div, so that when it is clicked the background colour of the div changes to red?

```html
<html>
  <div>
    <button>Click me!</button>
  </div>

  <button>Dont click me</button>
</html>
```

```javascript
document.querySelector('div button').addEventListenr('click', function () {
  document.querySelector('div').style.backgroundColor = 'red';
});
```

(4.) Store the contents of the input box with id 'favCol' into a variable called 'favouriteColor'.

```html
<html>
  <input type="text" id="favCol"/>
  <input type="text" id="leastFavCol"/>
  <input type="text" id="favFood"/>
</html>
```

```javascript
var favouriteColor = document.querySelector('#favCol').value;
```

(5.) Append a paragraph tag to the div with class 'my-articles'.

```html
<html>
  <body>
  <input type="text" id="search"/>

  <div class="my-articles">

  </div>
  </body>

</html>
```

```javascript
document.querySelector('.my-articles').innerHTML = '<p></p>';

// Or

var pEl = document.createElement('p');
document.querySelector('.my-articles').appendChild(pEl);
```

(6.) Write the necessary code to figure out how many list items are in the ul tag below:

```html
<html>
  <body>
  <input type="text" id="search"/>

  <ul>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
  </ul>
  </body>

</html>
```

```javascript
document.querySelector('ul').length;
```
