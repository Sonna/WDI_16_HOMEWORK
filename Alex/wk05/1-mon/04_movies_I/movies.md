---
source:
- title: movies.md
  url: https://gist.github.com/epoch/6a7ac3bce7684984d527#file-movies-md
---

### Movies I

## Specification

Build a web app that allows users to search for movies and display it on the
page. The web app will enlist the help of a library called HTTParty to fetch
movie information from a 3rd party service called OMDB API.

- Build a Sinatra application
  - Include:
    - main.rb
    - views/layout.erb
    - views/index.erb
    - views/movie.erb
    - views/about.erb
    - public/css/style.css

---

- index.erb - the search form with the input box
- movie.erb - details of the movie


example httparty usage

```ruby
require 'httparty'
result = HTTParty.get('http://omdbapi.com/?t=once')
result.parsed_response

```

## Additional Resources
- [demo](http://dt-movies-viewer.herokuapp.com)
- [Open movie database API](http://www.omdbapi.com/)
- [sinatrarb](http://www.sinatrarb.com/)
