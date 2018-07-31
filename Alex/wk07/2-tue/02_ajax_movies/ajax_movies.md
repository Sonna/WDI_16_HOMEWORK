---
source:
- title: ajax_movies.md
  url: https://gist.github.com/epoch/c173a5b0c545babd3c40da93e150303a
---

### Ajax Movies
* movies fetching using javascript
* this is a client side javascript app, no server side code needed

## Summary

The students will create a **new** movies app to allow users to search the
database of movies.

## Specification

Instead of returning a single title, the OMDb API allows you t do a search which
will return multiple titles.

For example if you search on Jaws, you will get a list like the following:

* Jaws
* Jaws 2
* Jaws 3-D
* Jaws Special
* Jaws Wired Shut

write a frontend app using AJAX, allow user to search for movies and show each
title from the search results within p tags with any page refresh.

- index.html
- app.js
- style.css

### Extension

turn each title within paragraph tags into a link that when click, goes to the corresponding IMDB movie page that opens in a new window

### jQuery ajax example

```javascript
// defining the callback function that will happen
// if the request succeeds.
function onSuccess(responseData) {
    console.log(responseData);
    // celebrate!
};

$.ajax({
  // What kind of request
  method: 'GET',

  // The URL for the request
  url: 'https://omdbapi/?s=jaws',

  // The type of data we want back
  dataType: 'json',

  // Code to run if the request succeeds; the JSON
  // response is passed to the function as an argument.
}).done(onSuccess);

```
