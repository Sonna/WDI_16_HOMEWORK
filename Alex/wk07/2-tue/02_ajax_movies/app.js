$(document).ready(function() {

  $('#movie-search').on('submit', function(event) {
    event.preventDefault();

    var query = $("#movie-search input[name='query']").val();

    $.ajax({
      method: 'GET',
      url: 'https://omdbapi.com/?s=' + query + '&apikey=2f6435d9',
      dataType: 'json',
    }).done(function onSuccess(data) {
      // console.log(data);
      if (data["Response"] === "True") {
        var resultsEl = document.getElementById("search-results");
        var newResultsEl = document.createElement("section");
        newResultsEl.id = "search-results";

        data["Search"].forEach(function(result) {
          var el = document.createElement("p");
          el.innerText = result["Title"];
          newResultsEl.appendChild(el);
        })

        resultsEl.parentNode.replaceChild(newResultsEl, resultsEl);
      }
    });
  });
});
