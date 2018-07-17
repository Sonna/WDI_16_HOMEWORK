---
source:
- title: movies2.md
  url: https://gist.github.com/epoch/bb116ac628ed11eab544
---

### Movies_2

* A more advanced version of the Movies Sinatra App

## Summary

The students will update their movies app to allow users to search the database
of movies.


## Specification

Instead of returning a single title, the OMDb API allows you to do a search
which will return multiple titles. Look up the documentation on
http://omdbapi.com to find out how to do that.

For example if you search for Jaws, you will get a list like the following:

* Jaws
* Jaws 2
* Jaws 3-D
* Jaws Special
* Jaws Wired Shut

Update your app to allow users to enter a search for movies, and to show the
list as a set of links. Users should then be able to click on the link and go to
the movie-etails page (like in your existing app).


### Extra credit:

Consider updating the search functionality so that if you just get one movie
back - you don't show the list but take the user straight to the page that shows
the information (fewer clicks makes for better user experience).

### Extra extra credit:

Everytime a user does a search save the movie searched into a file called
search_history.txt

add an extra path '/history' that list out all search history
