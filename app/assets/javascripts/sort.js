$(document).ready(function() {
  $(".sort-panel").on('click', '.btn', function(event) {
    event.preventDefault()
    var sortMethod = $(this).text()
    var $gameCards = []
    $(".game-card").each(function(index, element) {
      $gameCards.push(element)
    })
    $gameCards.sort(methods[sortMethod]);
    for (var i in $gameCards) {
      $('#game-container').append($gameCards[i])
    }
  })

  var methods = {
    "A-Z": function(a, b) {
      if ($(a).find("h4 a").text() < $(b).find("h4 a").text()) return -1
      if ($(b).find("h4 a").text() < $(a).find("h4 a").text()) return 1
      return 0
    },
    "Z-A": function(a, b) {
      if ($(b).find("h4 a").text() < $(a).find("h4 a").text()) return -1
      if ($(a).find("h4 a").text() < $(b).find("h4 a").text()) return 1
      return 0
    },
    "Highest Rated": function(a, b) {
      return $(b).find(".vote-score").text() - $(a).find(".vote-score").text()
    },
    "Most Commented": function(a, b) {
      return $(b).find(".comment-count").text() - $(a).find(".comment-count").text()
    }
  }

})
