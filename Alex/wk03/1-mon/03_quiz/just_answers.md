(1.) Write the correct javascript to select the second h1 element:

```javascript
document.querySelectorAll('h1')[1];
```

(2.) How would you change the contents of the element to be 'Friend'?

```javascript
document.querySelectorAll('h1')[1].textContent = 'Friend';
```

(3.) How would you add an event listener to the button element inside the div, so that when it is clicked the background colour of the div changes to red?

```javascript
document.querySelector('div button').addEventListenr('click', function () {
  document.querySelector('div').style.backgroundColor = 'red';
});
```

(4.) Store the contents of the input box with id 'favCol' into a variable called 'favouriteColor'.

```javascript
var favouriteColor = document.querySelector('#favCol').value;
```

(5.) Append a paragraph tag to the div with class 'my-articles'.


```javascript
document.querySelector('.my-articles').innerHTML = '<p></p>';

// Or

var pEl = document.createElement('p');
document.querySelector('.my-articles').appendChild(pEl);
```

(6.) Write the necessary code to figure out how many list items are in the ul tag below:

```javascript
document.querySelector('ul').length;
```
