$(document).ready(function() {
  $(".sort-panel").on('click', '.btn', function(event) {
    event.preventDefault()
    var sortMethod = $(this).text()


    // Sorts games
    var $gameCards = []
    $(".game-card").each(function(index, element) {
      $gameCards.push(element)
    })
    $gameCards.sort(methods[sortMethod]);
    for (var i in $gameCards) {
      $('#game-container').append($gameCards[i])
    }

    // Sorts categories
    var $categoryCards = []
    $(".category-card").each(function(index, element) {
      $categoryCards.push(element)
    })
    $categoryCards.sort(methods[sortMethod]);
    for (var i in $categoryCards) {
      $('#category-container').append($categoryCards[i])
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
      if ($(b).find(".comment-count").text() < $(a).find(".comment-count").text()) return -1
      if ($(a).find(".comment-count").text() < $(b).find(".comment-count").text()) return 1
      return 0
    },
    "Most Games": function(a, b) {
      if ($(b).find(".games-count").text() < $(a).find(".games-count").text()) return -1
      if ($(a).find(".games-count").text() < $(b).find(".games-count").text()) return 1
      return 0
    },
    "Fewest Games": function(a, b) {
      if ($(a).find(".games-count").text() < $(b).find(".games-count").text()) return -1
      if ($(b).find(".games-count").text() < $(a).find(".games-count").text()) return 1
      return 0
    },
  }

})
