function omdbOptions(query) {
  return {
    method: 'GET',
    url: 'https://omdbapi.com/?s=' + query + '&apikey=2f6435d9',
    dataType: 'json',
  };
}

function buildResult(result) {
  var el = document.createElement("p");
  el.innerHTML = '<a href="https://www.imdb.com/title/' + result["imdbID"] + '" target="_blank">' +
    result["Title"] +
    '</a>';
  return el;
}

function onSuccess(data) {
  // console.log(data);
  if (data["Response"] === "True") {
    var resultsEl = document.getElementById("search-results");
    var newResultsEl = document.createElement("section");
    newResultsEl.id = "search-results";

    data["Search"].forEach(function(result) {
      newResultsEl.appendChild(buildResult(result));
    });

    resultsEl.parentNode.replaceChild(newResultsEl, resultsEl);
  }
}

$(document).ready(function() {
  $('#movie-search').on('submit', function(event) {
    event.preventDefault();

    var query = $("#movie-search input[name='query']").val();
    $.ajax(omdbOptions(query)).done(onSuccess);
  });
});
